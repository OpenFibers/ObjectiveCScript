//
//  OCSBitwiseORResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 4/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Bitwise OR
//@"OCSBitwiseORResult ::="
//  @"ocsBitwiseXORResult@<OCSBitwiseXORResult> |"
//  @"nextBitwiseORResult@<OCSBitwiseORResult> '|' ocsBitwiseXORResult@<OCSBitwiseXORResult> ;\n"

#import "OCSBitwiseORResult.h"
#import "OCSBitwiseXORResult.h"

@implementation OCSBitwiseORResult
{
    OCSBitwiseORResult *_nextBitwiseORResult;
    OCSBitwiseXORResult *_ocsBitwiseXORResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextBitwiseORResult = [syntaxTree valueForTag:@"nextBitwiseORResult"];
        _ocsBitwiseXORResult = [syntaxTree valueForTag:@"ocsBitwiseXORResult"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextBitwiseORResult)
    {
        NSNumber *returnNumber = _ocsBitwiseXORResult.number;
        return returnNumber;
    }
    
    NSNumber *nextBitwiseORResultNumber = _nextBitwiseORResult.number;
    NSNumber *bitwiseXORResultNumber = _ocsBitwiseXORResult.number;
    
    int bitwiseXORResult = nextBitwiseORResultNumber.integerValue | bitwiseXORResultNumber.integerValue;
    return [NSNumber numberWithInt:bitwiseXORResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
