//
//  OCSTypeList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSTypeList.h"

@implementation OCSTypeList
{
    NSMutableArray *_typeList;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        _typeList = [NSMutableArray array];
        
        CPIdentifierToken *firstIdentifierToken = [syntaxTree valueForTag:@"firstType"];
        OCSTypeList *nextOCSIdentifierList = [syntaxTree valueForTag:@"nextTypeList"];
        if (firstIdentifierToken)
        {
            [_typeList addObject:firstIdentifierToken.identifier];
        }
        if (nextOCSIdentifierList)
        {
            [_typeList addObjectsFromArray:nextOCSIdentifierList.typeList];
        }
    }
    
    return self;
}

@end
