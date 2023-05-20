//
//  main.m
//  startFinderArgs
//
//  Created by shelley on 2023/5/15.
//

#import <Cocoa/Cocoa.h>
#import "BRLOptionParser.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *container = @"";
        NSString *rootDir = @"";
        NSString *filePath = @"";
        NSString *fileName = @"";
        NSString *newWindow = @"";
        NSString *emptyTrash = @"";
        BRLOptionParser *options = [BRLOptionParser new];

        [options setBanner:@"usage: Finder [-n <name>] [-vh]"];
        [options addOption:"container" flag:'c' description:@"sandBox Container" argument:&container];
        [options addOption:"root" flag:'r' description:@"rootDir" argument:&rootDir];
        [options addOption:"file" flag:'f' description:@"default file path" argument:&filePath];
        [options addOption:"name" flag:'n' description:@"default file name" argument:&fileName];
        [options addOption:"window" flag:'w' description:@"new window" argument:&newWindow];
        [options addOption:"empty" flag:'e' description:@"empty trash" argument:&emptyTrash];
        
        __weak typeof(options) weakOptions = options;
        [options addOption:"help" flag:'h' description:@"Show this message" block:^{
           printf("%s", [[weakOptions description] UTF8String]);
           exit(EXIT_SUCCESS);
        }];

        NSError *error = nil;
        if (![options parseArgc:argc argv:argv error:&error]) {
           const char * message = error.localizedDescription.UTF8String;
           fprintf(stderr, "[shelley]%s: %s\n", argv[0], message);
            NSLog(@"[shelley]%s: %s\n", argv[0], message);
           exit(EXIT_FAILURE);
        }
        
        NSArray *argsArr = @[ container, rootDir, filePath, fileName, newWindow, emptyTrash];
        for (NSString *arg in argsArr) {
            if (![arg isEqualToString:@""]) {
                NSLog(@"[shelley] %d %@", __LINE__, arg);
            }
        }
    }
    return NSApplicationMain(argc, argv);
}
