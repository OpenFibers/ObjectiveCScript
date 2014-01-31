//
//  OCSMessageSendArg.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMessageSendArg ::="
//  @"ocsMethodName@'Identifier' ':' ocsAtomicFactor@<OCSAtomicFactor> |"
//  @"ocsMethodName@'Identifier' ':' ocsArgType@<OCSArgumentType> ocsAtomicFactor@<OCSAtomicFactor>;\n"

#import "OCSMessageSendArg.h"
#import "OCSAtomicFactor.h"

@implementation OCSMessageSendArg

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        CPIdentifierToken *ocsMethodNameToken = [syntaxTree valueForTag:@"ocsMethodName"];
        _ocsMethodNamelet = [ocsMethodNameToken.identifier stringByAppendingString:@":"];
        
        _ocsAtomicFactor = [syntaxTree valueForTag:@"ocsAtomicFactor"];
    }
    return self;
}

@end
