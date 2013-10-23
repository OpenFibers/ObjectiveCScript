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

NSString *const classString =
@"@implementation OCSAppDelegate"
@"- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions"
@"{"
@"    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];"
@"    // Override point for customization after application launch."
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
    CPTokenStream *tokenStream = [OCSTokeniser tokenise:expressionString];
    NSLog(@"tokenStream: %@", tokenStream);
    
    CPParser *parser = [OCSParser parser];
    NSLog(@"ANSWER %3.1f", [(Expression *)[parser parse:tokenStream] value]);
}

@end
