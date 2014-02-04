//
//  OCSTerm.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 1/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//binary operator '*' '/' '%' left to right
//@"OCSTerm ::="
//  @"ocsAtomicFactor@<OCSAtomicFactor> |"
//  @"nextTerm@<OCSTerm> '*' ocsAtomicFactor@<OCSAtomicFactor> |"
//  @"nextTerm@<OCSTerm> '/' ocsAtomicFactor@<OCSAtomicFactor> |"
//  @"nextTerm@<OCSTerm> '%' ocsAtomicFactor@<OCSAtomicFactor> ;\n"

#import "OCSTerm.h"
#import "OCSAtomicFactor.h"

#warning unfinished caculation and archivement

typedef enum {
    OCSTermOperatorTypeNone = 0,
    OCSTermOperatorTypeMultiply,    // *
    OCSTermOperatorTypeDevide,      // /
    OCSTermOperatorTypeModulo,      // %
} OCSTermOperatorType;

@implementation OCSTerm
{
    OCSAtomicFactor *_factor;
    OCSTerm *_nextTerm;
    OCSTermOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextTerm = [syntaxTree valueForTag:@"nextTerm"];
        _factor = [syntaxTree valueForTag:@"ocsAtomicFactor"];
        
        if (_nextTerm)
        {
            CPKeywordToken *operatorKeyword = [syntaxTree childAtIndex:1];
            NSString *operatorString = operatorKeyword.keyword;
            if ([operatorString isEqualToString:@"*"])
            {
                _operatorType = OCSTermOperatorTypeMultiply;
            }
            else if ([operatorString isEqualToString:@"/"])
            {
                _operatorType = OCSTermOperatorTypeDevide;
            }
            else if ([operatorString isEqualToString:@"%"])
            {
                _operatorType = OCSTermOperatorTypeModulo;
            }
        }
    }
    
//    NSLog(@"%@", [self description]);
    
    return self;
}

- (NSNumber *)number
{
    if (!_nextTerm)
    {
        NSNumber *returnNumber = _factor.number;
        return returnNumber;
    }
    
    NSNumber *factorNumber = _factor.number;
    NSNumber *nextTermNumber = _nextTerm.number;
    if (_operatorType == OCSTermOperatorTypeMultiply)
    {
        int term = nextTermNumber.intValue * factorNumber.intValue;
        return [NSNumber numberWithInt:term];
    }
    else if (_operatorType == OCSTermOperatorTypeDevide)
    {
        int term = nextTermNumber.intValue / factorNumber.intValue;
        return [NSNumber numberWithInt:term];
    }
    else if (_operatorType == OCSTermOperatorTypeModulo)
    {
        int term = nextTermNumber.intValue % factorNumber.intValue;
        return [NSNumber numberWithInt:term];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
