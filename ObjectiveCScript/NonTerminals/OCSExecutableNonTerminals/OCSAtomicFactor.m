//
//  OCSAtomicFactor.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSAtomicFactor.h"

#warning unfinished caculation and archivement

@implementation OCSAtomicFactor
{
    NSNumber *_number;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        CPNumberToken *numberToken = [syntaxTree valueForTag:@"ocsNumber"];
        if (numberToken)
        {
            _number = numberToken.number;
        }
    }
    return self;
}

@end
