//
//  OCSIdentifierDeclaration.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. UIView *_aView, *_bView;

#import "OCSIdentifierDeclaration.h"
#import "OCSIdentifierList.h"

@implementation OCSIdentifierDeclaration
{
    NSString *_typeString;
    NSArray *_ocsIdentifierArray;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        CPIdentifierToken *ocsTypeToken = [syntaxTree valueForTag:@"ocsType"];
        OCSIdentifierList *ocsIdentifierList = [syntaxTree valueForTag:@"ocsIdentifierList"];
        if (ocsTypeToken)
        {
            _typeString = ocsTypeToken.identifier;
        }
        if (ocsIdentifierList)
        {
            _ocsIdentifierArray = ocsIdentifierList.ocsIdentifiers;
        }
    }
    return self;
}

@end
