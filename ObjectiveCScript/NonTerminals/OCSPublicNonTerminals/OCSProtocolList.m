//
//  OCSClassProtocolList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSProtocolList.h"
#import "OCSIdentifierList.h"

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
        OCSIdentifierList *identifierList = [syntaxTree valueForTag:@"identifierList"];
        if (identifierList)
        {
            _protocols = [NSArray arrayWithArray:identifierList.identifierList];
        }
        else
        {
            _protocols = [NSArray array];
        }
    }
    
    return self;
}

@end
