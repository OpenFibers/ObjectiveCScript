//
//  OCSIdentifierDeclaration.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. UIView *_aView, *_bView;

#import "OCSIdentifierDeclaration.h"
#import "OCSIdentifierList.h"
#import "OCSIdentifier.h"
#import "OCSType.h"

@implementation OCSIdentifierDeclaration
{
    NSString *_typeString;
    OCSMetaType _metaType;
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
        _typeString = @"";
        
        OCSType *ocsType = [syntaxTree valueForTag:@"ocsType"];
        OCSIdentifierList *ocsIdentifierList = [syntaxTree valueForTag:@"ocsIdentifierList"];
        if (ocsType)
        {
            _typeString = ocsType.ocsTypeString;
            _metaType = ocsType.ocsMetaType;
        }
        
        NSMutableDictionary *identifiers = [NSMutableDictionary dictionary];
        
        if (ocsIdentifierList)
        {
            for (OCSIdentifier *eachIdentifier in ocsIdentifierList.ocsIdentifiers)
            {
                eachIdentifier.ocsTypeString = _typeString;
                eachIdentifier.ocsMetaType = _metaType;
                [identifiers setObject:eachIdentifier forKey:eachIdentifier.ocsIdentifierName];
            }
        }
        _ocsDeclaredIdentifiers = [NSDictionary dictionaryWithDictionary:identifiers];
    }
    return self;
}

@end
