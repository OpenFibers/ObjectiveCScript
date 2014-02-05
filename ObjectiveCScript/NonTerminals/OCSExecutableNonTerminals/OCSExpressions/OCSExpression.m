//
//  OCSExpression.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 5/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//  @"OCSExpression ::= conditionalResult@<OCSConditionalOperatorResult>;\n"

#import "OCSExpression.h"
#import "OCSConditionalOperatorResult.h"

@implementation OCSExpression
{
    OCSConditionalOperatorResult *_conditionalResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _conditionalResult = [syntaxTree valueForTag:@"conditionalResult"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    return _conditionalResult.number;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
