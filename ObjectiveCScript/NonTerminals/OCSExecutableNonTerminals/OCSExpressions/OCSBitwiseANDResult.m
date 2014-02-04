//
//  OCSBitwiseANDResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 3/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Bitwise AND
//@"OCSBitwiseANDResult ::="
//  @"ocsEqualityResult@<OCSEqualityResult> |"
//  @"nextBitwiseANDResult@<OCSBitwiseANDResult> '&' ocsEqualityResult@<OCSEqualityResult> ;\n"

#import "OCSBitwiseANDResult.h"
#import "OCSEqualityResult.h"

@implementation OCSBitwiseANDResult
{
    OCSBitwiseANDResult *_nextBitwiseANDResult;
    OCSEqualityResult *_ocsEqualityResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextBitwiseANDResult = [syntaxTree valueForTag:@"nextBitwiseANDResult"];
        _ocsEqualityResult = [syntaxTree valueForTag:@"ocsEqualityResult"];
    }
    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextBitwiseANDResult)
    {
        NSNumber *returnNumber = _ocsEqualityResult.number;
        return returnNumber;
    }
    
    NSNumber *nextBitwiseANDResultNumber = _nextBitwiseANDResult.number;
    NSNumber *equalityResultNumber = _ocsEqualityResult.number;

    int bitwiseANDResult = nextBitwiseANDResultNumber.integerValue & equalityResultNumber.integerValue;
    return [NSNumber numberWithInt:bitwiseANDResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
