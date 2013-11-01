//
//  OCSIdentifierList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSIdentifierList.h"

@implementation OCSIdentifierList
{
    NSMutableArray *_identifierList;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        _identifierList = [NSMutableArray array];
        
        CPIdentifierToken *firstIdentifierToken = [syntaxTree valueForTag:@"firstIdentifier"];
        OCSIdentifierList *nextOCSIdentifierList = [syntaxTree valueForTag:@"nextIdentifierList"];
        if (firstIdentifierToken)
        {
            [_identifierList addObject:firstIdentifierToken.identifier];
        }
        if (nextOCSIdentifierList)
        {
            [_identifierList addObjectsFromArray:nextOCSIdentifierList.identifierList];
        }
    }
    
    return self;
}

@end
