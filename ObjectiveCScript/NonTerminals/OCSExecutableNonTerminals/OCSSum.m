//
//  OCSSum.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 1/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

//binary operator '+' '-' left to right
//@"OCSSum ::="
//  @"ocsTerm@<OCSTerm> |"
//  @"nextSum@<OCSSum> '+' ocsTerm@<OCSTerm> |"
//  @"nextSum@<OCSSum> '-' ocsTerm@<OCSTerm> ;\n"

#import "OCSSum.h"
#import "OCSTerm.h"

#warning unfinished caculation and archivement

typedef enum {
    OCSSubOperatorTypeNone = 0,
    OCSSumOperatorTypeAdd,         // +
    OCSSumOperatorTypeSubtract,     // -
} OCSSubOperatorType;

@implementation OCSSum
{
    OCSTerm *_ocsTerm;
    OCSSum *_nextSum;
    OCSSubOperatorType _operatorType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _nextSum = [syntaxTree valueForTag:@"nextSum"];
        _ocsTerm = [syntaxTree valueForTag:@"ocsTerm"];
        
        if (_nextSum)
        {
            CPKeywordToken *operatorToken = [syntaxTree childAtIndex:1];
            NSString *operatorString = operatorToken.keyword;
            if ([operatorString isEqualToString:@"+"])
            {
                _operatorType = OCSSumOperatorTypeAdd;
            }
            else if ([operatorString isEqualToString:@"-"])
            {
                _operatorType = OCSSumOperatorTypeSubtract;
            }
        }
    }
    return self;
}

- (NSNumber *)number
{
    if (!_nextSum)
    {
        return _ocsTerm.number;
    }
    
    NSNumber *nextSumNumber = _nextSum.number;
    NSNumber *termNumber = _ocsTerm.number;
    if (_operatorType == OCSSumOperatorTypeAdd)
    {
        int sum = nextSumNumber.intValue + termNumber.intValue;
        return [NSNumber numberWithInt:sum];
    }
    else if (_operatorType == OCSSumOperatorTypeSubtract)
    {
        int sum = nextSumNumber.intValue - termNumber.intValue;
        return [NSNumber numberWithInt:sum];
    }
    return @0;
}

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@"value :%@", self.number];
}

@end
