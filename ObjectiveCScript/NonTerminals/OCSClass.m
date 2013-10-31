//
//  OCSClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClass.h"

@implementation OCSClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        NSLog(@"Expression initWithSyntaxTree: %@", syntaxTree);
    }
    
    return self;
}

@end
