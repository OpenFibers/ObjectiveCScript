//
//  OCSLogicalORResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 4/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Logical OR
//@"OCSLogicalORResult ::="
//  @"ocsLogicalANDResult@<OCSLogicalANDResult> |"
//  @"nextLogicalORResult@<OCSLogicalORResult> '&&' ocsLogicalANDResult@<OCSLogicalANDResult> ;\n"

#import "OCSLogicalORResult.h"
#import "OCSLogicalANDResult.h"

@implementation OCSLogicalORResult
{
    OCSLogicalORResult *_nextLogicalORResult;
    OCSLogicalANDResult *_ocsLogicalANDResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextLogicalORResult = [syntaxTree valueForTag:@"nextLogicalORResult"];
        _ocsLogicalANDResult = [syntaxTree valueForTag:@"ocsLogicalANDResult"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextLogicalORResult)
    {
        NSNumber *returnNumber = _ocsLogicalANDResult.number;
        return returnNumber;
    }
    
    NSNumber *nextLogicalORResultNumber = _nextLogicalORResult.number;
    NSNumber *logicalANDResultNumber = _ocsLogicalANDResult.number;
    
    int logicalORResult = nextLogicalORResultNumber.integerValue || logicalANDResultNumber.integerValue;
    return [NSNumber numberWithInt:logicalORResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
