//
//  OCSLogicalComparationResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 2/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Logic comparation
//@"OCSLogicalComparationResult ::="
//  @"ocsBitwiseShiftResult@<OCSBitwiseShiftResult> |"
//  @"nextComparationResult@<OCSLogicalComparationResult> '<' ocsBitwiseShiftResult@<OCSBitwiseShiftResult> |"
//  @"nextComparationResult@<OCSLogicalComparationResult> '<=' ocsBitwiseShiftResult@<OCSBitwiseShiftResult> |"
//  @"nextComparationResult@<OCSLogicalComparationResult> '>=' ocsBitwiseShiftResult@<OCSBitwiseShiftResult> |"
//  @"nextComparationResult@<OCSLogicalComparationResult> '>' ocsBitwiseShiftResult@<OCSBitwiseShiftResult> ;\n"

#import "OCSLogicalComparationResult.h"
#import "OCSBitwiseShiftResult.h"

typedef enum {
    OCSLogicComparationOperatorTypeNone = 0,
    OCSLogicComparationOperatorTypeLess,            // <
    OCSLogicComparationOperatorTypeLessOrEqual,     // <=
    OCSLogicComparationOperatorTypeGreaterOrEqual,  // >=
    OCSLogicComparationOperatorTypeGreater,         // >
} OCSLogicComparationOperatorType;

@implementation OCSLogicalComparationResult
{
    OCSLogicalComparationResult *_nextComparationResult;
    OCSBitwiseShiftResult *_ocsBitwiseShiftResult;
    OCSLogicComparationOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextComparationResult = [syntaxTree valueForTag:@"nextComparationResult"];
        _ocsBitwiseShiftResult = [syntaxTree valueForTag:@"ocsBitwiseShiftResult"];
        
        if (_nextComparationResult)
        {
            CPKeywordToken *operatorToken = [syntaxTree childAtIndex:1];
            NSString *operatorString = operatorToken.keyword;
            if ([operatorString isEqualToString:@"<"])
            {
                _operatorType = OCSLogicComparationOperatorTypeLess;
            }
            else if ([operatorString isEqualToString:@"<="])
            {
                _operatorType = OCSLogicComparationOperatorTypeLessOrEqual;
            }
            else if ([operatorString isEqualToString:@">="])
            {
                _operatorType = OCSLogicComparationOperatorTypeGreaterOrEqual;
            }
            else if ([operatorString isEqualToString:@">"])
            {
                _operatorType = OCSLogicComparationOperatorTypeGreater;
            }
        }
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextComparationResult)
    {
        NSNumber *returnNumber = _ocsBitwiseShiftResult.number;
        return returnNumber;
    }
    
    NSNumber *nextComparationResultNumber = _nextComparationResult.number;
    NSNumber *shiftResultNumber = _ocsBitwiseShiftResult.number;
    if (_operatorType == OCSLogicComparationOperatorTypeLess)
    {
        BOOL comparationResult = nextComparationResultNumber.intValue < shiftResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    else if (_operatorType == OCSLogicComparationOperatorTypeLessOrEqual)
    {
        BOOL comparationResult = nextComparationResultNumber.intValue <= shiftResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    else if (_operatorType == OCSLogicComparationOperatorTypeGreaterOrEqual)
    {
        BOOL comparationResult = nextComparationResultNumber.intValue >= shiftResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    else if (_operatorType == OCSLogicComparationOperatorTypeGreater)
    {
        BOOL comparationResult = nextComparationResultNumber.intValue > shiftResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
