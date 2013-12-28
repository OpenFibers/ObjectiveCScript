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
    NSDictionary *_declaredIdentifiers;
}

- (NSDictionary *)declaredIdentifiers
{
    return _declaredIdentifiers;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSIdentifierDeclarationList *list = [syntaxTree valueForTag:@"declarationList"];
        if (list)
        {
            _declaredIdentifiers = list.declaredIdentifiers;
        }
        else
        {
            _declaredIdentifiers = [NSDictionary dictionary];
        }
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _declaredIdentifiers = [aDecoder decodeObjectForKey:OCSIvarListDeclaredIdentifiersArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_declaredIdentifiers)
    {
        [aCoder encodeObject:_declaredIdentifiers forKey:OCSIvarListDeclaredIdentifiersArchivedKey];
    }
}

@end
