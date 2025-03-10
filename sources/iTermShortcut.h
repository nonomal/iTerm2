//
//  iTermShortcut.h
//  iTerm2
//
//  Created by George Nachman on 6/27/16.
//
//

#import <Cocoa/Cocoa.h>
#import "NSDictionary+iTerm.h"
#import "ProfileModel.h"

@class iTermKeystroke;

extern const NSEventModifierFlags kHotKeyModifierMask;
extern CGFloat kShortcutPreferredHeight;

// Describes a keyboard shortcut for opening a hotkey window.
@interface iTermShortcut : NSObject<NSCopying>
@property(nonatomic, assign) NSUInteger keyCode;
@property(nonatomic, assign) BOOL hasKeyCode;
@property(nonatomic, assign) NSEventModifierFlags modifiers;
@property(nonatomic, copy) NSString *characters;
@property(nonatomic, copy) NSString *charactersIgnoringModifiers;
@property(nonatomic, readonly) BOOL smellsAccidental;
@property(nonatomic, readonly) iTermKeystroke *keystroke;

// Suitable for display.
@property(nonatomic, readonly) NSString *stringValue;

// Uniquely describes the shortcut for testing with equality against other kinds of hotkeys (e.g.,
// modifier double-presses) and excludes irrelevant info (like characters with modifiers).
@property(nonatomic, readonly) iTermHotKeyDescriptor *descriptor;

// Is this shortcut assigned? If not, it "empty" and can't be used.
@property(nonatomic, readonly) BOOL isAssigned;

// A complete serialization.
@property(nonatomic, readonly) NSDictionary *dictionaryValue;

// Takes a dictionary like the one produced by -[iTermShortcut dictionaryValue].
+ (instancetype)shortcutWithDictionary:(NSDictionary *)dictionary;

// Returns assigned shortcuts for a profile.
+ (NSArray<iTermShortcut *> *)shortcutsForProfile:(Profile *)profile;

// Returns the shortcut for a keydown event.
+ (instancetype)shortcutWithEvent:(NSEvent *)event;

+ (instancetype)shortcutWithEvent:(NSEvent *)event leaderAllowed:(BOOL)leaderAllowed;

+ (NSString *)shortStringForDictionary:(NSDictionary *)dict;
+ (NSDictionary *)dictionaryForShortString:(NSString *)string;

- (instancetype)initWithKeyCode:(NSUInteger)code
                     hasKeyCode:(BOOL)hasKeyCode
                      modifiers:(NSEventModifierFlags)modifiers
                     characters:(NSString *)characters
    charactersIgnoringModifiers:(NSString *)charactersIgnoringModifiers NS_DESIGNATED_INITIALIZER;

// Change in place from a KeyDown event.
- (void)setFromEvent:(NSEvent *)event;

// Does the event match this shortcut?
- (BOOL)eventIsShortcutPress:(NSEvent *)event;

- (BOOL)isEqualToShortcut:(iTermShortcut *)object;

@end
