//
//  NSWorkspace+iTerm.h
//  iTerm2
//
//  Created by George Nachman on 5/11/15.
//
//

#import <Cocoa/Cocoa.h>

@interface NSWorkspace (iTerm)

// Returns a filename for a temp file. The file will be named /tmp/\(prefix)\(random stuff)\(suffix)
- (NSString *)temporaryFileNameWithPrefix:(NSString *)prefix suffix:(NSString *)suffix;

- (BOOL)it_securityAgentIsActive;
- (BOOL)it_openURL:(NSURL *)url;
- (NSString *)it_newToken;
- (BOOL)it_checkToken:(NSString *)token;

@end
