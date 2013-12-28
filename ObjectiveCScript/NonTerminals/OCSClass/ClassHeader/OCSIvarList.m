//
//  OCSIvarList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/3/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSIvarList.h"
#import "OCSIdentifierDeclarationList.h"

NSString *const OCSIvarListDeclaredIdentifiersArchivedKey = @"OCSILDI";

@implementation OCSIvarList
{
    NSDictionary *_ocsDeclaredIdentifiers;
}

- (NSDictionary *)ocsDeclaredIdentifiers
{
    return _ocsDeclaredIdentifiers;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSIdentifierDeclarationList *list = [syntaxTree valueForTag:@"declarationList"];
        if (list)
        {
            _ocsDeclaredIdentifiers = list.ocsDeclaredIdentifiers;
        }
        else
        {
            _ocsDeclaredIdentifiers = [NSDictionary dictionary];
        }
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsDeclaredIdentifiers = [aDecoder decodeObjectForKey:OCSIvarListDeclaredIdentifiersArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsDeclaredIdentifiers)
    {
        [aCoder encodeObject:_ocsDeclaredIdentifiers forKey:OCSIvarListDeclaredIdentifiersArchivedKey];
    }
}

@end
