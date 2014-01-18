//
//  OCSMessageSendArgList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMessageSendArgList ::="
//  @"ocsMessageSendArg@<OCSMessageSendArg> |"
//  @"ocsMessageSendArg@<OCSMessageSendArg> nextMessageSendArgList@<OCSMessageSendArgList> ;\n"

#import "OCSMessageSendArgList.h"
#import "OCSMessageSendArg.h"

@implementation OCSMessageSendArgList

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMessageSendArg *messageArg = [syntaxTree valueForTag:@"ocsMessageSendArg"];
        OCSMessageSendArgList *nextMessageSendArgList = [syntaxTree valueForTag:@"nextMessageSendArgList"];
        
        NSMutableArray *argArray = [NSMutableArray arrayWithObject:messageArg];
        if (nextMessageSendArgList)
        {
            [argArray addObjectsFromArray:nextMessageSendArgList.ocsMessageSendArgs];
        }
        _ocsMessageSendArgs = [NSArray arrayWithArray:argArray];
    }
    return self;
}

@end
