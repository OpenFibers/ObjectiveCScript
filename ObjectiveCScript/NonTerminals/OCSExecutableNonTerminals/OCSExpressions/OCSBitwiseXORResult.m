//
//  OCSBitwiseXORResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 3/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSBitwiseXORResult ::="
//  @"ocsBitwiseANDResult@<OCSBitwiseANDResult> |"
//  @"nextBitwiseXORResult@<OCSBitwiseXORResult> '^' ocsBitwiseANDResult@<OCSBitwiseANDResult> ;\n"

#import "OCSBitwiseXORResult.h"
#import "OCSBitwiseANDResult.h"

@implementation OCSBitwiseXORResult
{
    OCSBitwiseXORResult *_nextBitwiseXORResult;
    OCSBitwiseANDResult *_ocsBitwiseANDResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextBitwiseXORResult = [syntaxTree valueForTag:@"nextBitwiseXORResult"];
        _ocsBitwiseANDResult = [syntaxTree valueForTag:@"ocsBitwiseANDResult"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextBitwiseXORResult)
    {
        NSNumber *returnNumber = _ocsBitwiseANDResult.number;
        return returnNumber;
    }
    
    NSNumber *nextBitwiseXORResultNumber = _nextBitwiseXORResult.number;
    NSNumber *bitwiseANDResultNumber = _ocsBitwiseANDResult.number;
    
    int bitwiseXORResult = nextBitwiseXORResultNumber.integerValue ^ bitwiseANDResultNumber.integerValue;
    return [NSNumber numberWithInt:bitwiseXORResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
