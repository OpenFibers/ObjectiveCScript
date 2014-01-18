//
//  OCSMessageSendArg.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMessageSendArg ::="
//  @"ocsMethodName@'Identifier' ':' ocsReturnableFactor@<OCSReturnableFactor> |"
//  @"ocsMethodName@'Identifier' ':' ocsArgType@<OCSArgumentType> ocsReturnableFactor@<OCSReturnableFactor>;\n"

#import "OCSMessageSendArg.h"
#import "OCSReturnableFactor.h"

@implementation OCSMessageSendArg

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        CPIdentifierToken *ocsMethodNameToken = [syntaxTree valueForTag:@"ocsMethodName"];
        _ocsMethodNamelet = [ocsMethodNameToken.identifier stringByAppendingString:@":"];
        
        _ocsReturnableFactor = [syntaxTree valueForTag:@"ocsReturnableFactor"];
    }
    return self;
}

@end
