//
//  OCSIdentifierList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. viewA, *viewB

#import "OCSIdentifierList.h"
#import "OCSIdentifier.h"

@implementation OCSIdentifierList
{
    NSMutableArray *_ocsIdentifiers;
}

- (NSArray *)ocsIdentifiers
{
    return [NSArray arrayWithArray:_ocsIdentifiers];
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        _ocsIdentifiers = [NSMutableArray array];
        
        OCSIdentifier *firstIdentifier = [syntaxTree valueForTag:@"firstIdentifier"];
        OCSIdentifierList *nextIdentifierList = [syntaxTree valueForTag:@"nextIdentifierList"];
        
        if (firstIdentifier)
        {
            [_ocsIdentifiers addObject:firstIdentifier];
        }
        if (nextIdentifierList)
        {
            [_ocsIdentifiers addObjectsFromArray:nextIdentifierList.ocsIdentifiers];
        }
        
    }
    
    return self;
}
@end
