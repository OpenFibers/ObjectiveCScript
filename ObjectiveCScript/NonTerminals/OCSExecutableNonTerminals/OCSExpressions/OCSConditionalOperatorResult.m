//
//  OCSConditionalOperatorResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 5/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Conditional operator
//@"OCSConditionalOperatorResult ::="
//  @"ocsLogicalORResult@<OCSLogicalORResult> |"
//  @"ocsLogicalORResult@<OCSLogicalORResult> '?'"
//  @"centerConditional@<OCSConditionalOperatorResult> ':' "
//  @"rightConditional@<OCSConditionalOperatorResult> ;\n"

#import "OCSConditionalOperatorResult.h"
#import "OCSLogicalORResult.h"

@implementation OCSConditionalOperatorResult
{
    OCSConditionalOperatorResult *_centerConditionalResult;
    OCSConditionalOperatorResult *_rightConditionalResult;
    OCSLogicalORResult *_ocsLogicalORResult;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _ocsLogicalORResult = [syntaxTree valueForTag:@"ocsLogicalORResult"];
        _centerConditionalResult = [syntaxTree valueForTag:@"centerConditional"];
        _rightConditionalResult = [syntaxTree valueForTag:@"rightConditional"];
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_centerConditionalResult || !_rightConditionalResult)
    {
        NSNumber *returnNumber = _ocsLogicalORResult.number;
        return returnNumber;
    }
    
    NSNumber *logicalORResultNumber = _ocsLogicalORResult.number;
    NSNumber *centerConditionalNumber = _centerConditionalResult.number;
    NSNumber *rightConditionalNumber = _rightConditionalResult.number;
    
    int conditionalResult = logicalORResultNumber.integerValue ?
                            centerConditionalNumber.integerValue :
                            rightConditionalNumber.integerValue;
    return [NSNumber numberWithInt:conditionalResult];
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
