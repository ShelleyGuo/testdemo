//
//  AppDelegate.m
//  startFinderArgs
//
//  Created by shelley on 2023/5/15.
//

#import "AppDelegate.h"
NSMutableArray *url_array;
@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)application:(NSApplication *)application openURLs:(NSArray<NSURL *> *)urls {
    NSString *argv = [[NSString stringWithFormat:@"%@",[urls firstObject]]stringByRemovingPercentEncoding];
    [url_array addObject:argv];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *str in url_array) {
        NSString *perfix = [str substringToIndex:2];
        NSString *arg = [str substringFromIndex:3];
        [dic setObject:arg forKey:perfix];
    }
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    url_array = [NSMutableArray array];
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
