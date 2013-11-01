//
//  OCSAppDelegate.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 9/23/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSAppDelegate.h"
#import <CoreParse/CoreParse.h>
#import "Expression.h"
#import "ObjectiveCScriptParser.h"
#import "OCSFile.h"

NSString *const classString =
@"@implementation OCSAppDelegate\n"
@"- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions"
@"{"
@"    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];"
@"    // Override point for customization after application launch.\n"
@"    self.window.backgroundColor = [UIColor whiteColor];"
@"    [self.window makeKeyAndVisible];"
@"    "
@"    [self test];"
@"    "
@"    return YES;"
@"}"
@"- (void)test"
@"{"
@"    CPTokenStream *tokenStream = [OCSTokeniser tokenise:@\"5llU + 5lu * 16f + (2.0f / 5.0u + 9l) * 8ll\"];"
@"    NSLog(@\"tokenStream: %@\", tokenStream);"
@"    "
@"    CPParser *parser = [OCSParser parser];"
@"    NSLog(@\"ANSWER %3.1f\", [(Expression *)[parser parse:tokenStream] value]);"
@"}"
@""
@"@end";

NSString *const expressionString = @"5llU + 5lu * 16f + (2.0f / 5.0u + 9l) * 8ll";
NSString *const stringString = @"@\"5llU \\\" \\\" + 5lu * 16f + (2.0f / 5.0u + 9l) * 8ll\"";
NSString *const fileTestString = @"@interface ABC : DEF <";

@implementation OCSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self test];
    
    return YES;
}
     
- (void)test
{
    CPTokenStream *tokenStream = [OCSTokeniser tokenise:fileTestString];
    NSLog(@"tokenStream: %@", tokenStream);
    
    CPParser *parser = [OCSParser parser];
    OCSFile *result = [parser parse:tokenStream];
    if ([result isKindOfClass:[Expression class]])
    {
        NSLog(@"ANSWER %3.1f", [(Expression *)[parser parse:tokenStream] value]);
    }
    else if ([result isKindOfClass:[OCSFile class]])
    {
        [(OCSFile *)result inject];
        NSData *data = [result archivedData];
        [data writeToFile:@"/Users/openthread/Desktop/1.plist" atomically:YES];
        
        OCSFile *a = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [a inject];
    }
}

@end
