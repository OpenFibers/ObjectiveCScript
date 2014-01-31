//
//  OCSMethodSend.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMessageSend ::="
//  //method with args
//  @"'[' ocsMessageReceiver@<OCSAtomicFactor> ocsMessageSendArgList@<OCSMessageSendArgList> ']' |"
//  //method without args
//  @"'[' ocsMessageReceiver@<OCSAtomicFactor> ocsMethodNameWithoutArg@'Identifier' ']' ;\n"

#import "OCSMessageSend.h"
#import "OCSAtomicFactor.h"
#import "OCSMessageSendArgList.h"
#import "OCSMessageSendArg.h"

@implementation OCSMessageSend
{
    OCSAtomicFactor *_messageReceiver;
    NSString *_ocsMethodName;
    NSArray *_ocsMessageArgumentArray;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _messageReceiver = [syntaxTree valueForTag:@"ocsMessageReceiver"];
        
        OCSMessageSendArgList *ocsMessageArgList = [syntaxTree valueForTag:@"ocsMessageSendArgList"];
        CPIdentifierToken *messageNameToken = [syntaxTree valueForTag:@"ocsMethodNameWithoutArg"];
        if (messageNameToken)
        {
            _ocsMethodName = messageNameToken.identifier;
            _ocsMessageArgumentArray = @[];
        }
        else if (ocsMessageArgList)
        {
            NSMutableString *methodName = [NSMutableString string];
            NSMutableArray *methodArgs = [NSMutableArray array];
            for (OCSMessageSendArg *ocsMethodSendArg in ocsMessageArgList.ocsMessageSendArgs)
            {
                [methodName appendString:ocsMethodSendArg.ocsMethodNamelet];
                [methodArgs addObject:ocsMethodSendArg.ocsAtomicFactor];
            }
            _ocsMethodName = [NSString stringWithString:methodName];
            _ocsMessageArgumentArray = [NSArray arrayWithArray:methodArgs];
        }
    }
    return self;
}

@end
