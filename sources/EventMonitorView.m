//
//  EventMonitorView.m
//  iTerm
//
//  Created by George Nachman on 11/9/11.
//  Copyright (c) 2011 George Nachman. All rights reserved.
//

#import "EventMonitorView.h"

#import "FutureMethods.h"
#import "iTermApplicationDelegate.h"
#import "NSEvent+iTerm.h"
#import "PointerPrefsController.h"
#import "ThreeFingerTapGestureRecognizer.h"

@implementation EventMonitorView {
    IBOutlet PointerPrefsController *pointerPrefs_;
    IBOutlet NSTextField *label_;
    int numTouches_;

    ThreeFingerTapGestureRecognizer *_threeFingerTapGestureRecognizer;
    NSInteger _maximumStage;
}

- (void)awakeFromNib {
    self.allowedTouchTypes = NSTouchTypeMaskIndirect;
    [self setWantsRestingTouches:YES];
    _threeFingerTapGestureRecognizer =
        [[ThreeFingerTapGestureRecognizer alloc] initWithTarget:self
                                                       selector:@selector(threeFingerTap:)];

}

- (void)dealloc {
    [_threeFingerTapGestureRecognizer disconnectTarget];
}

- (void)touchesBeganWithEvent:(NSEvent *)ev {
    numTouches_ = [[ev touchesMatchingPhase:(NSTouchPhaseBegan | NSTouchPhaseStationary)
                                     inView:self] count];
    [_threeFingerTapGestureRecognizer touchesBeganWithEvent:ev];
    DLog(@"EventMonitorView touchesBeganWithEvent:%@; numTouches=%d", ev, numTouches_);
}

- (void)touchesEndedWithEvent:(NSEvent *)ev {
    numTouches_ = [[ev touchesMatchingPhase:NSTouchPhaseStationary
                                     inView:self] count];
    [_threeFingerTapGestureRecognizer touchesEndedWithEvent:ev];
    DLog(@"EventMonitorView touchesEndedWithEvent:%@; numTouches=%d", ev, numTouches_);
}

- (void)touchesCancelledWithEvent:(NSEvent *)ev {
    numTouches_ = 0;
    [_threeFingerTapGestureRecognizer touchesCancelledWithEvent:ev];
    DLog(@"EventMonitorView touchesCancelledWithEvent:%@; numTouches=%d", ev, numTouches_);
}

- (void)showNotSupported
{
    [label_ setStringValue:@"You can't customize that button"];
    [label_ performSelector:@selector(setStringValue:) withObject:@"Click or Tap Here to Set Input Fields" afterDelay:1];
}

- (void)mouseUp:(NSEvent *)theEvent {
    if ([_threeFingerTapGestureRecognizer mouseUp:theEvent]) {
        DLog(@"Three finger trap gesture recognizer cancels mouseUp");
        return;
    }

    DLog(@"EventMonitorView mouseUp:%@", theEvent);
    if (numTouches_ == 3) {
        [pointerPrefs_ setGesture:kThreeFingerClickGesture
                        modifiers:[theEvent it_modifierFlags]];
    } else if (_maximumStage < 2) {
        [self showNotSupported];
    }
    _maximumStage = 0;
}

- (void)mouseDown:(NSEvent *)event {
    if ([_threeFingerTapGestureRecognizer mouseDown:event]) {
        DLog(@"Three finger trap gesture recognizer cancels mouseDown");
        return;
    } else {
        [super mouseDown:event];
    }
}

- (void)pressureChangeWithEvent:(NSEvent *)event {
    ITERM_IGNORE_PARTIAL_BEGIN
    if ([event respondsToSelector:@selector(stage)]) {
        _maximumStage = MAX(_maximumStage, event.stage);
        if (event.stage == 2) {
            [pointerPrefs_ setGesture:kForceTouchSingleClick modifiers:[event it_modifierFlags]];
        }
    }
    ITERM_IGNORE_PARTIAL_END
}

- (void)rightMouseDown:(NSEvent*)event {
    if ([_threeFingerTapGestureRecognizer rightMouseDown:event]) {
        DLog(@"Three finger trap gesture recognizer cancels rightMouseDown");
        return;
    } else {
        [super rightMouseDown:event];
    }
}

- (void)rightMouseUp:(NSEvent *)theEvent {
    if ([_threeFingerTapGestureRecognizer rightMouseUp:theEvent]) {
        DLog(@"Three finger trap gesture recognizer cancels rightMouseUp");
        return;
    }

    DLog(@"EventMonitorView rightMouseUp:%@", theEvent);
    int buttonNumber = 1;
    int clickCount = [theEvent clickCount];
    int modMask = [theEvent it_modifierFlags];
    [pointerPrefs_ setButtonNumber:buttonNumber clickCount:clickCount modifiers:modMask];
    [super mouseDown:theEvent];
}

- (void)otherMouseDown:(NSEvent *)theEvent
{
    DLog(@"EventMonitorView otherMouseDown:%@", theEvent);
    int buttonNumber = [theEvent buttonNumber];
    int clickCount = [theEvent clickCount];
    int modMask = [theEvent it_modifierFlags];
    [pointerPrefs_ setButtonNumber:buttonNumber clickCount:clickCount modifiers:modMask];
    [super mouseDown:theEvent];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor controlBackgroundColor] set];
    NSRectFill(self.bounds);
    [[NSColor separatorColor] set];
    NSFrameRect(NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height));

    [super drawRect:dirtyRect];
}

- (void)threeFingerTap:(NSEvent *)event {
    [pointerPrefs_ setGesture:kThreeFingerClickGesture modifiers:[event it_modifierFlags]];
}

@end
