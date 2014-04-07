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
#import "OTTimeProfileTool.h"

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
@"    NSLog(@\"tokenStream: %@ %d %d %d %d\", tokenStream, true, false, YES, NO);"
@"    "
@"    CPParser *parser = [OCSParser parser];"
@"    NSLog(@\"ANSWER %3.1f\", [(Expression *)[parser parse:tokenStream] value]);"
@"}"
@""
@"@end";

//NSString *const expressionString = @"5llU + 5lu * 16f + (2.0f / 5.0u + 9l) * 8ll";
NSString *const stringString = @"@\"5llU \\\" \\\" + 5lu * 16f + (2.0f / 5.0u + 9l) * 8ll\"";
NSString *const operatorString = @"sizeof ( ) [ ] { } . -> ++ += + -- -= - *= * /= / %= % ^= ^ && &= & || |= | <<= << <= < >>= >> >= > == = != ! ~ ? : @ , ; \"";

NSString *const fileTestString =
@"@interface ABC : DEF <f>"
@"{"
@"  void ***a, b, *c;"
@"  int b, *c;"
@"  ff *c;"
@"}"
@"- (id*)aaa:(void)bbb ccc:(NSString *)ddd"
@"{"
@" 1*3*6 + 2 - 3 >> 2 < 5 == 1 & 0x111 ^ 0x111 | 0x1000 && 0 || (1 ? 0 : 1) ? 4 : +(-5 + 1)"
@"}"
;

NSString *const expressionString = @" 1*3*(6 + 2)";

NSString *const quoteString = @"\"\\\\\\\"\"";//c string \"

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
//    int a = 0?2:3?4:5;//a = 4
    int b = 1*3*6 + 2 - 3 >> 2 < 5 == 1 & 0x111 ^ 0x111 | 0x1000 && 0 || (1 ? 0 : 1) ? 4 : +(-5 + 1);
    CPTokenStream *tokenStream = [OCSTokeniser tokenise:quoteString];
    NSLog(@"tokenStream: %@", tokenStream);
    
    OTTimeProfileTool *profileTool = [[OTTimeProfileTool alloc] init];
    [profileTool beginFlagCPUTime];
    CPParser *parser = [OCSParser parser];
    [profileTool flagCPUTime]; //#0
    OCSFile *result = [parser parse:tokenStream];
    [profileTool flagCPUTime];//#1
    
    if ([result isKindOfClass:[OCSFile class]])
    {
        [(OCSFile *)result inject];
        [profileTool flagCPUTime];//#2
        
        NSData *data = [result archivedData];
        [profileTool flagCPUTime];//#3
        [data writeToFile:@"/Users/openthread/Desktop/1.plist" atomically:YES];
        [profileTool flagCPUTime];//#4
        OCSFile *a = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [profileTool flagCPUTime];//#5
        [a inject];
        [profileTool endFlagCPUTime];//#6
    }
}

@end
