//
//  OCSClassProtocolList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. <UIWebViewDelegate, UIApplicationDelegate>

#import "OCSProtocolList.h"
#import "OCSTypeList.h"

@implementation OCSProtocolList
{
    NSArray *_protocols;
}

- (NSArray *)protocols
{
    return _protocols;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSTypeList *identifierList = [syntaxTree valueForTag:@"identifierList"];
        if (identifierList)
        {
            _protocols = [NSArray arrayWithArray:identifierList.typeList];
        }
        else
        {
            _protocols = [NSArray array];
        }
    }
    
    return self;
}

@end
