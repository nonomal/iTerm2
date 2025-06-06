//
//  iTermBuriedSessions.m
//  iTerm2
//
//  Created by George Nachman on 1/25/17.
//
//

#import "iTermBuriedSessions.h"

#import "DebugLogging.h"
#import "iTermAdvancedSettingsModel.h"
#import "iTermApplication.h"
#import "iTermProfilePreferences.h"
#import "iTermRestorableSession.h"
#import "iTermTmuxWindowCache.h"
#import "iTermVariableScope.h"
#import "NSArray+iTerm.h"
#import "PseudoTerminal.h"
#import "PTYSession.h"
#import "PTYTab.h"
#import "TmuxControllerRegistry.h"

NSString *const iTermSessionBuriedStateChangeTabNotification = @"iTermSessionBuriedStateChangeTabNotification";

@implementation iTermBuriedSessions {
    NSMutableArray<iTermRestorableSession *> *_array;
}

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(tmuxWindowCacheDidChange:)
                                                     name:iTermTmuxWindowCacheDidChange
                                                   object:nil];
    }
    return self;
}

- (BOOL)swapSession:(PTYSession *)living withBuriedSession:(PTYSession *)buried {
    const NSInteger i = [_array indexOfObjectPassingTest:^BOOL(iTermRestorableSession *restorableSession, NSUInteger idx, BOOL * _Nonnull stop) {
        return restorableSession.sessions.count == 1 && restorableSession.sessions.firstObject == buried;
    }];
    if (i == NSNotFound) {
        return NO;
    }
    _array[i].sessions = @[living];
    _array[i].channelParentGuid = living.channelParentGuid;
    [self refresh:living];
    [[NSNotificationCenter defaultCenter] postNotificationName:iTermSessionBuriedStateChangeTabNotification
                                                        object:buried];
    return YES;
}

- (void)addBuriedSession:(PTYSession *)sessionToBury {
    DLog(@"addBuriedSession:%@", sessionToBury);
    id<iTermWindowController> windowController = (PseudoTerminal *)sessionToBury.delegate.parentWindow;
    iTermRestorableSession *restorableSession = [windowController restorableSessionForSession:sessionToBury];
    if (!restorableSession) {
        DLog(@"Failed to create restorable session");
        return;
    }
    [self addRestorableSession:restorableSession forSession:sessionToBury];
}

- (void)addRestorableSession:(iTermRestorableSession *)restorableSession
                  forSession:(PTYSession *)sessionToBury {
    [_array addObject:restorableSession];
    [self refresh:sessionToBury];
}

- (void)refresh:(PTYSession *)session {
    [self updateMenus];
    [NSApp invalidateRestorableState];
    [[NSNotificationCenter defaultCenter] postNotificationName:iTermSessionBuriedStateChangeTabNotification
                                                        object:session];
}

- (void)restoreSession:(PTYSession *)session {
    iTermRestorableSession *restorableSession = nil;
    for (iTermRestorableSession *candidate in _array) {
        if ([candidate.sessions containsObject:session]) {
            restorableSession = candidate;
            break;
        }
    }
    if (restorableSession) {
        [self restoreSession:session withRestorableSession:restorableSession];
    }
}

- (NSInteger)indexForTabForChannelSessionWithParent:(NSString *)parentGuid {
    PTYSession *parent = [[iTermController sharedInstance] sessionWithGUID:parentGuid];
    if (!parent) {
        return NSNotFound;
    }
    PseudoTerminal *term = [[iTermController sharedInstance] terminalWithSession:parent];
    if (!term) {
        return NSNotFound;
    }
    PTYTab *tab = [term tabForSession:parent];
    NSInteger i = term.tabs.count;
    if (tab) {
        i = [term.tabs indexOfObject:tab];
        if (i == NSNotFound) {
            i = term.tabs.count;
        }
    }
    return i;
}

- (void)restoreSession:(PTYSession *)session withRestorableSession:(iTermRestorableSession *)restorableSession {
    [_array removeObject:restorableSession];
    DLog(@"Restore %@", session);
    [session disinter];
    DLog(@"Look for terminal with guid %@", restorableSession.terminalGuid);
    PseudoTerminal *term = [[iTermController sharedInstance] terminalWithGuid:restorableSession.terminalGuid];
    if (term) {
        DLog(@"Found it. Look for tab with unique id %@", @(restorableSession.tabUniqueId));
        // Reuse an existing window
        PTYTab *tab = [term tabWithUniqueId:restorableSession.tabUniqueId];
        if (restorableSession.group == kiTermRestorableSessionGroupChannel) {
            const NSInteger i = [self indexForTabForChannelSessionWithParent:restorableSession.channelParentGuid];
            if (i != NSNotFound) {
                [term insertSession:session atIndex:[term numberOfTabs]];
                [[term currentTab] numberOfSessionsDidChange];
            } else {
                [term addRevivedSession:restorableSession.sessions[0]];
            }
        } else if (tab) {
            DLog(@"Found it. Re-create the tab.");
            // Add to existing tab by destroying and recreating it.
            [term recreateTab:tab
              withArrangement:restorableSession.arrangement
                     sessions:restorableSession.sessions
                       revive:NO];
        } else {
            DLog(@"The tab doesn't exist. Create a new tab and add the session to it");
            // Create a new tab and add the session to it.
            [term addRevivedSession:restorableSession.sessions[0]];
        }
    } else {
        // Create a new term and add the session to it.
        DLog(@"Failed to find the terminal by uid. Create a new window and add the session to it.");
        term = [[PseudoTerminal alloc] initWithSmartLayout:YES
                                                windowType:restorableSession.windowType
                                           savedWindowType:restorableSession.savedWindowType
                                                    screen:restorableSession.screen
                                                   profile:nil];
        if (term) {
            [[iTermController sharedInstance] addTerminalWindow:term];
            term.terminalGuid = restorableSession.terminalGuid;
            [term addRevivedSession:restorableSession.sessions[0]];
            [term fitWindowToTabs];
            if (restorableSession.windowTitle) {
                [term.scope setValue:restorableSession.windowTitle
                    forVariableNamed:iTermVariableKeyWindowTitleOverrideFormat];
            }
            if (restorableSession.windowType == WINDOW_TYPE_LION_FULL_SCREEN) {
                [term delayedEnterFullscreen];
            }
        }
    }
    [self refresh:session];
}

- (NSArray<PTYSession *> *)buriedSessions {
    return [_array flatMapWithBlock:^NSArray *(iTermRestorableSession *anObject) {
        return anObject.sessions;
    }];
}

- (NSArray<NSDictionary *> *)restorableState {
    return [_array mapWithBlock:^id(iTermRestorableSession *anObject) {
        return [anObject restorableState];
    }];
}

- (void)restoreFromState:(NSArray<NSDictionary *> *)state {
    for (NSDictionary *dict in state) {
        iTermRestorableSession *restorable = [[iTermRestorableSession alloc] initWithRestorableState:dict];
        if (restorable) {
            [_array addObject:restorable];
        }
    }
    [self updateMenus];
    [[NSNotificationCenter defaultCenter] postNotificationName:iTermSessionBuriedStateChangeTabNotification object:nil];
}

- (void)setMenus:(NSArray<NSMenu *> *)menus {
    _menus = [menus copy];
    [self updateMenus];
}

- (void)updateMenus {
    for (NSMenu *menu in _menus) {
        [self updateMenu:menu];
    }
}

- (void)updateMenu:(NSMenu *)menu {
    if (!menu) {
        return;
    }
    BOOL needsSeparator = NO;
    [menu removeAllItems];
    for (PTYSession *session in [[iTermBuriedSessions sharedInstance] buriedSessions]) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[session.name removingHTMLFromTabTitleIfNeeded]
                                                      action:@selector(disinter:)
                                               keyEquivalent:@""];
        item.representedObject = session;
        item.target = self;
        [menu addItem:item];
        needsSeparator = YES;
    }

    for (iTermTmuxWindowCacheWindowInfo *window in [[iTermTmuxWindowCache sharedInstance] hiddenWindows]) {
        if (needsSeparator) {
            needsSeparator = NO;
            [menu addItem:[NSMenuItem separatorItem]];
        }

        NSString *clientName = [window.clientName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (!clientName.length) {
            clientName = @"tmux";
        }
        NSString *title = [NSString stringWithFormat:@"%@%@ — %@", [iTermAdvancedSettingsModel tmuxTitlePrefix], clientName, window.name];
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:title
                                                      action:@selector(disinterTmuxWindow:)
                                               keyEquivalent:@""];
        item.target = self;
        item.representedObject = window;
        [menu addItem:item];
    }

    [[menu.supermenu.itemArray objectPassingTest:^BOOL(NSMenuItem *element, NSUInteger index, BOOL *stop) {
        return element.submenu == menu;
    }] setEnabled:menu.itemArray.count > 0];
}

- (void)disinter:(NSMenuItem *)menuItem {
    PTYSession *session = menuItem.representedObject;
    [[iTermBuriedSessions sharedInstance] restoreSession:session];
}

// TODO: Remember the affinities and the profile.
- (void)disinterTmuxWindow:(NSMenuItem *)menuItem {
    iTermTmuxWindowCacheWindowInfo *window = menuItem.representedObject;
    TmuxController *controller =
        [[TmuxControllerRegistry sharedInstance] controllerForClient:window.clientName];
    [controller openWindowWithId:window.windowNumber
                     intentional:YES
                         profile:controller.sharedProfile];

}

- (void)terminateAll {
    [_array enumerateObjectsUsingBlock:^(iTermRestorableSession * _Nonnull restorableSession, NSUInteger idx, BOOL * _Nonnull stop) {
        [restorableSession.sessions enumerateObjectsUsingBlock:^(PTYSession *session, NSUInteger idx, BOOL * _Nonnull stop) {
            if (!session.exited && !session.isTmuxClient) {
                [session terminate];
            }
        }];
    }];
}

#pragma mark - tmux

- (void)tmuxWindowCacheDidChange:(NSNotification *)notification {
    [self updateMenus];
}

@end
