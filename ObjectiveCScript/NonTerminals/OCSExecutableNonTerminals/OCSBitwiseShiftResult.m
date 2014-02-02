//
//  OCSBitwiseShiftResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 2/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//Bitwise shift operator '<<' '>>'
//@"OCSBitwiseShiftResult ::= "
//  @"ocsSum@<OCSSum> |"
//  @"nextShiftResult@<OCSBitwiseShiftResult> '<<' ocsSum@<OCSSum> |"
//  @"nextShiftResult@<OCSBitwiseShiftResult> '>>' ocsSum@<OCSSum> ;\n"

#import "OCSBitwiseShiftResult.h"
#import "OCSSum.h"

typedef enum {
    OCSBitwiseShiftOperatorTypeNone = 0,
    OCSBitwiseShiftOperatorTypeLeft,      // <<
    OCSBitwiseShiftOperatorTypeRight,     // >>
} OCSBitwiseShiftOperatorType;

@implementation OCSBitwiseShiftResult
{
    OCSBitwiseShiftResult *_nextShiftResult;
    OCSSum *_ocsSum;
    OCSBitwiseShiftOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextShiftResult = [syntaxTree valueForTag:@"nextShiftResult"];
        _ocsSum = [syntaxTree valueForTag:@"ocsSum"];
        
        if (_nextShiftResult)
        {
            CPKeywordToken *operatorToken = [syntaxTree childAtIndex:1];
            NSString *operatorString = operatorToken.keyword;
            if ([operatorString isEqualToString:@"<<"])
            {
                _operatorType = OCSBitwiseShiftOperatorTypeLeft;
            }
            else if ([operatorString isEqualToString:@">>"])
            {
                _operatorType = OCSBitwiseShiftOperatorTypeRight;
            }
        }
    }
    NSLog(@"%@", self.number);
    return self;
}

- (NSNumber *)number
{
    if (!_nextShiftResult)
    {
        return _ocsSum.number;
    }
    
    NSNumber *nextShiftResultNumber = _nextShiftResult.number;
    NSNumber *sumNumber = _ocsSum.number;
    if (_operatorType == OCSBitwiseShiftOperatorTypeLeft)
    {
        int shiftResult = nextShiftResultNumber.intValue << sumNumber.intValue;
        return [NSNumber numberWithInt:shiftResult];
    }
    else if (_operatorType == OCSBitwiseShiftOperatorTypeRight)
    {
        int sum = nextShiftResultNumber.intValue >> sumNumber.intValue;
        return [NSNumber numberWithInt:sum];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
