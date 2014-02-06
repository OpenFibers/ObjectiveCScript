//
//  OCSUnaryResult.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 6/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//unary
//@"OCSUnaryResult ::="
//  @"ocsAtomicFactor@<OCSAtomicFactor> |"
//  @" '+' nextUnaryResult@<OCSUnaryResult> ;\n"

#import "OCSUnaryResult.h"
#import "OCSAtomicFactor.h"

typedef enum {
    OCSUnaryOperatorTypeNone = 0,
    OCSUnaryOperatorTypeIncrement,          // ++
    OCSUnaryOperatorTypeDecrement,          // --
    OCSUnaryOperatorTypePlus,               // +
    OCSUnaryOperatorTypeMinus,              // -
    OCSUnaryOperatorTypeLogicalNOT,         // !
    OCSUnaryOperatorTypeOnceComplement,     // ~
    OCSUnaryOperatorTypePointerReference,   // *
    OCSUnaryOperatorTypeAddressOf,          // &
    OCSUnaryOperatorTypeSizeOf,             // sizeof()
    OCSUnaryOperatorTypeTypeCast,           // (type)
} OCSUnaryOperatorType;

@implementation OCSUnaryResult
{
    OCSAtomicFactor *_factor;
    OCSUnaryResult *_nextUnaryResult;
    OCSUnaryOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextUnaryResult = [syntaxTree valueForTag:@"nextUnaryResult"];
        _factor = [syntaxTree valueForTag:@"ocsAtomicFactor"];
        
        if (_nextUnaryResult)
        {
            CPKeywordToken *operatorKeyword = [syntaxTree childAtIndex:0];
            NSString *operatorString = operatorKeyword.keyword;
            if ([operatorString isEqualToString:@"+"])
            {
                _operatorType = OCSUnaryOperatorTypePlus;
            }
            else if ([operatorString isEqualToString:@"-"])
            {
                _operatorType = OCSUnaryOperatorTypeMinus;
            }
        }
    }
    
    NSLog(@"%@", [self description]);
    
    return self;
}

- (NSNumber *)number
{
    if (!_nextUnaryResult)
    {
        NSNumber *returnNumber = _factor.number;
        return returnNumber;
    }
    
    NSNumber *nextTermNumber = _nextUnaryResult.number;
    if (_operatorType == OCSUnaryOperatorTypePlus)
    {
        int result = + nextTermNumber.intValue;
        return [NSNumber numberWithInt:result];
    }
    else if (_operatorType == OCSUnaryOperatorTypeMinus)
    {
        int result = - nextTermNumber.intValue;
        return [NSNumber numberWithInt:result];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
