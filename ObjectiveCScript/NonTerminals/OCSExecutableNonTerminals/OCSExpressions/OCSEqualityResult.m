//
//  OCSEqualityResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 3/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Equality and inequality
//@"OCSEqualityResult ::="
//  @"ocsLogicComparationResult@<OCSLogicComparationResult> |"
//  @"nextEqualityResult@<OCSEqualityResult> '==' ocsLogicComparationResult@<OCSLogicComparationResult> |"
//  @"nextEqualityResult@<OCSEqualityResult> '!=' ocsLogicComparationResult@<OCSLogicComparationResult> ;\n"

#import "OCSEqualityResult.h"
#import "OCSLogicComparationResult.h"

typedef enum {
    OCSEqualityOperatorTypeNone = 0,
    OCSEqualityOperatorTypeEqual,       //<
    OCSEqualityOperatorTypeInequal,     // !=
} OCSEqualityOperatorType;

@implementation OCSEqualityResult
{
    OCSEqualityResult *_nextEqualityResult;
    OCSLogicComparationResult *_ocsLogicComparationResult;
    OCSEqualityOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextEqualityResult = [syntaxTree valueForTag:@"nextEqualityResult"];
        _ocsLogicComparationResult = [syntaxTree valueForTag:@"ocsLogicComparationResult"];
        
        if (_nextEqualityResult)
        {
            CPKeywordToken *operatorToken = [syntaxTree childAtIndex:1];
            NSString *operatorString = operatorToken.keyword;
            if ([operatorString isEqualToString:@"=="])
            {
                _operatorType = OCSEqualityOperatorTypeEqual;
            }
            else if ([operatorString isEqualToString:@"!="])
            {
                _operatorType = OCSEqualityOperatorTypeInequal;
            }
        }
    }
//    NSLog(@"%@", self);
    return self;
}

- (NSNumber *)number
{
    if (!_nextEqualityResult)
    {
        NSNumber *returnNumber = _ocsLogicComparationResult.number;
        return returnNumber;
    }
    
    NSNumber *nextEqualityResultNumber = _nextEqualityResult.number;
    NSNumber *comparationResultNumber = _ocsLogicComparationResult.number;
    if (_operatorType == OCSEqualityOperatorTypeEqual)
    {
        BOOL comparationResult = nextEqualityResultNumber.intValue == comparationResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    else if (_operatorType == OCSEqualityOperatorTypeInequal)
    {
        BOOL comparationResult = nextEqualityResultNumber.intValue != comparationResultNumber.intValue;
        return [NSNumber numberWithBool:comparationResult];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
