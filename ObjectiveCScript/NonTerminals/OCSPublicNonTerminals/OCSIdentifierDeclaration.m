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

@implementation OCSIdentifierDeclaration
{
    NSString *_typeString;
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
        
        CPIdentifierToken *ocsTypeToken = [syntaxTree valueForTag:@"ocsType"];
        OCSIdentifierList *ocsIdentifierList = [syntaxTree valueForTag:@"ocsIdentifierList"];
        if (ocsTypeToken)
        {
            _typeString = ocsTypeToken.identifier;
        }
        
        NSMutableDictionary *identifiers = [NSMutableDictionary dictionary];
        
        if (ocsIdentifierList)
        {
            for (OCSIdentifier *eachIdentifier in ocsIdentifierList.ocsIdentifiers)
            {
                eachIdentifier.typeString = _typeString;
                
#warning meta type is dummy value now.
                eachIdentifier.metaType = OCSIdentifierMetaTypeCustom;
                
                [identifiers setObject:eachIdentifier forKey:eachIdentifier.ocsIdentifierName];
            }
        }
        _declaredIdentifiers = [NSDictionary dictionaryWithDictionary:identifiers];
    }
    return self;
}

@end
