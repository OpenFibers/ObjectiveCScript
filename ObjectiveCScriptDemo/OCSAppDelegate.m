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
    CPTokenStream *tokenStream = [OCSTokeniser tokenise:@"5 + 5 * 16 + (2.0 / 5.0 + 9) * 8"];
    NSLog(@"tokenStream: %@", tokenStream);
    
    CPParser *parser = [OCSParser parser];
    NSLog(@"ANSWER %3.1f", [(Expression *)[parser parse:tokenStream] value]);
}

@end
