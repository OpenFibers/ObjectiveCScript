//
//  OCSTypeList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. UIWebViewDelegate, UIApplicationDelegate

#import "OCSTypeList.h"

@implementation OCSTypeList
{
    NSMutableArray *_ocsTypeList;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        _ocsTypeList = [NSMutableArray array];
        
        CPIdentifierToken *firstIdentifierToken = [syntaxTree valueForTag:@"firstType"];
        OCSTypeList *nextOCSIdentifierList = [syntaxTree valueForTag:@"nextTypeList"];
        if (firstIdentifierToken)
        {
            [_ocsTypeList addObject:firstIdentifierToken.identifier];
        }
        if (nextOCSIdentifierList)
        {
            [_ocsTypeList addObjectsFromArray:nextOCSIdentifierList.ocsTypeList];
        }
    }
    
    return self;
}

@end
