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
    OCSIdentifierMetaType _metaType;
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
                eachIdentifier.typeString = _typeString;
                eachIdentifier.metaType = _metaType;
                [identifiers setObject:eachIdentifier forKey:eachIdentifier.ocsIdentifierName];
            }
        }
        _declaredIdentifiers = [NSDictionary dictionaryWithDictionary:identifiers];
    }
    return self;
}

@end
