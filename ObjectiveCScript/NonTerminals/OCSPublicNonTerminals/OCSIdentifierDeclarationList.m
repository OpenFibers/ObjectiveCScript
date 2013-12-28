//
//  OCSIdentifierDeclarationList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/5/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  several OCSIdentifierDeclaration

#import "OCSIdentifierDeclarationList.h"
#import "OCSIdentifierDeclaration.h"
#import "OCSIdentifier.h"

NSString *const OCSIdentifierDeclarationListDeclaredIdentifiersArchivedKey = @"OCSIDLDI";

@implementation OCSIdentifierDeclarationList
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
        NSMutableDictionary *identifiers = [NSMutableDictionary dictionary];
        
        OCSIdentifierDeclaration *firstDeclaration = [syntaxTree valueForTag:@"firstDeclaration"];
        OCSIdentifierDeclarationList *nextDeclarationList = [syntaxTree valueForTag:@"nextDeclarationList"];
        
        if (firstDeclaration)
        {
            for (NSString *eachIdentifierName in firstDeclaration.ocsDeclaredIdentifiers.allKeys)
            {
                [identifiers setObject:firstDeclaration.ocsDeclaredIdentifiers[eachIdentifierName]
                                forKey:eachIdentifierName];
            }
        }
        if (nextDeclarationList)
        {
            for (NSString *eachIdentifierName in nextDeclarationList.ocsDeclaredIdentifiers.allKeys)
            {
                [identifiers setObject:nextDeclarationList.ocsDeclaredIdentifiers[eachIdentifierName]
                                forKey:eachIdentifierName];
            }
        }
        
        _ocsDeclaredIdentifiers = [NSDictionary dictionaryWithDictionary:identifiers];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsDeclaredIdentifiers = [aDecoder decodeObjectForKey:OCSIdentifierDeclarationListDeclaredIdentifiersArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsDeclaredIdentifiers)
    {
        [aCoder encodeObject:_ocsDeclaredIdentifiers
                      forKey:OCSIdentifierDeclarationListDeclaredIdentifiersArchivedKey];
    }
}

@end
