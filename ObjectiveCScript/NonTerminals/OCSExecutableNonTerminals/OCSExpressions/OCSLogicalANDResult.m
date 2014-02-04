//
//  OCSLogicalANDResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 4/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Logical AND
//@"OCSLogicalANDResult ::="
//  @"ocsBitwiseORResult@<OCSBitwiseORResult> |"
//  @"ocsLogicalANDResult@<OCSLogicalANDResult> '|' ocsBitwiseORResult@<OCSBitwiseORResult> ;\n"

#import "OCSLogicalANDResult.h"
#import "OCSBitwiseORResult.h"

@implementation OCSLogicalANDResult
{
    OCSLogicalANDResult *_nextLogicalANDResult;
    OCSBitwiseORResult *_ocsBitwiseORResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextLogicalANDResult = [syntaxTree valueForTag:@"ocsLogicalANDResult"];
        _ocsBitwiseORResult = [syntaxTree valueForTag:@"ocsBitwiseORResult"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextLogicalANDResult)
    {
        NSNumber *returnNumber = _ocsBitwiseORResult.number;
        return returnNumber;
    }
    
    NSNumber *nextLogicalANDResultNumber = _nextLogicalANDResult.number;
    NSNumber *bitwiseORResultNumber = _ocsBitwiseORResult.number;
    
    int logicalANDResult = nextLogicalANDResultNumber.integerValue && bitwiseORResultNumber.integerValue;
    return [NSNumber numberWithInt:logicalANDResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
