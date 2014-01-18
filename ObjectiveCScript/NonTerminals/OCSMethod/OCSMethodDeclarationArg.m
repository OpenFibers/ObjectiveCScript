//
//  OCSMethodDeclarationArg.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMethodDeclarationArg ::="
//  @"ocsMethodName@'Identifier' ':' ocsArgType@<OCSArgumentType> ocsArgName@'Identifier';\n"

#import "OCSMethodDeclarationArg.h"
#import "OCSArgumentType.h"
#import "OCSIdentifier.h"

@implementation OCSMethodDeclarationArg

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        CPIdentifierToken *classNameToken = [syntaxTree valueForTag:@"ocsMethodName"];
        _ocsMethodNamelet = [classNameToken.identifier stringByAppendingString:@":"];
        
        CPIdentifierToken *argumentToken = [syntaxTree valueForTag:@"ocsArgName"];
        NSString *argumentName = argumentToken.identifier;
        
        OCSArgumentType *argumentType = [syntaxTree valueForTag:@"ocsArgType"];
        _ocsIdentifier = [[OCSIdentifier alloc] initWithIdentifierName:argumentName
                                                          pointerCount:argumentType.ocsPointerCount
                                                            typeString:argumentType.ocsTypeString
                                                              metaType:argumentType.ocsMetaType];
    }
    return self;
}

@end
