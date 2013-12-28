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
        NSMutableDictionary *identifiers = [NSMutableDictionary dictionary];
        
        OCSIdentifierDeclaration *firstDeclaration = [syntaxTree valueForTag:@"firstDeclaration"];
        OCSIdentifierDeclarationList *nextDeclarationList = [syntaxTree valueForTag:@"nextDeclarationList"];
        
        if (firstDeclaration)
        {
            for (NSString *eachIdentifierName in firstDeclaration.declaredIdentifiers.allKeys)
            {
                [identifiers setObject:firstDeclaration.declaredIdentifiers[eachIdentifierName]
                                forKey:eachIdentifierName];
            }
        }
        if (nextDeclarationList)
        {
            for (NSString *eachIdentifierName in nextDeclarationList.declaredIdentifiers.allKeys)
            {
                [identifiers setObject:nextDeclarationList.declaredIdentifiers[eachIdentifierName]
                                forKey:eachIdentifierName];
            }
        }
        
        _declaredIdentifiers = [NSDictionary dictionaryWithDictionary:identifiers];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _declaredIdentifiers = [aDecoder decodeObjectForKey:OCSIdentifierDeclarationListDeclaredIdentifiersArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_declaredIdentifiers)
    {
        [aCoder encodeObject:_declaredIdentifiers
                      forKey:OCSIdentifierDeclarationListDeclaredIdentifiersArchivedKey];
    }
}

@end
