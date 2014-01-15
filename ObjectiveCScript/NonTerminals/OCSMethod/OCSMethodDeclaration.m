//
//  OCSMethodDeclaration.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//
//@"OCSMethodDeclaration ::="
//  @"ocsMethodType@<OCSMethodType> ocsMethodReturnType@<OCSArgumentType>"//method with args
//  @"ocsMethodArgList@<OCSMethodDeclarationArgList> |"
//  @"ocsMethodType@<OCSMethodType> ocsMethodReturnType@<OCSArgumentType>"//method with args
//  @"ocsMethodNameWithoutArg@'Identifier';\n"

#import "OCSMethodDeclaration.h"
#import "OCSMethodType.h"
#import "OCSArgumentType.h"
#import "OCSMethodDeclarationArgList.h"
#import "OCSMethodDeclarationArg.h"

@implementation OCSMethodDeclaration
{
    OCSMethodMetaType _ocsMethodMetaType;
    OCSArgumentType *_ocsMethodReturnType;
    NSString *_ocsMethodName;
    NSDictionary *_ocsMethodArguments;
}

- (OCSMethodMetaType)ocsMethodMetaType
{
    return _ocsMethodMetaType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodType *ocsMethodType = [syntaxTree valueForTag:@"ocsMethodType"];
        _ocsMethodMetaType = ocsMethodType.ocsMethodMetaType;
        
        _ocsMethodReturnType = [syntaxTree valueForTag:@"ocsMethodReturnType"];
        
        OCSMethodDeclarationArgList *ocsMethodArgList = [syntaxTree valueForTag:@"ocsMethodArgList"];
        CPIdentifierToken *classNameToken = [syntaxTree valueForTag:@"ocsMethodNameWithoutArg"];
        if (classNameToken)
        {
            _ocsMethodName = classNameToken.identifier;
            _ocsMethodArguments = @{};
        }
        else if (ocsMethodArgList)
        {
            NSMutableString *methodName = [NSMutableString string];
            NSMutableDictionary *methodArgs = [NSMutableDictionary dictionary];
            for (OCSMethodDeclarationArg *ocsMethodDeclarationArg in ocsMethodArgList.ocsMethodArgs)
            {
                [methodName appendString:ocsMethodDeclarationArg.ocsMethodNamelet];
                [methodArgs setObject:ocsMethodDeclarationArg.ocsIdentifier
                               forKey:ocsMethodDeclarationArg.ocsIdentifier.ocsIdentifierName];
            }
            _ocsMethodName = [NSString stringWithString:methodName];
            _ocsMethodArguments = [NSDictionary dictionaryWithDictionary:methodArgs];
        }
    }
    return self;
}

@end
