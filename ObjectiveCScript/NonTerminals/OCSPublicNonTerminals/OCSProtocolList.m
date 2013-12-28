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
    NSArray *_ocsProtocols;
}

- (NSArray *)ocsProtocols
{
    return _ocsProtocols;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSTypeList *identifierList = [syntaxTree valueForTag:@"identifierList"];
        if (identifierList)
        {
            _ocsProtocols = [NSArray arrayWithArray:identifierList.ocsTypeList];
        }
        else
        {
            _ocsProtocols = [NSArray array];
        }
    }
    
    return self;
}

@end
