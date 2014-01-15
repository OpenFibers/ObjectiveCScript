//
//  OCSMethodDeclarationArgList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//@"OCSMethodDeclarationArgList ::="
//  @"ocsDelarationArg@<OCSMethodDeclarationArg> |"
//  @"ocsDelarationArg@<OCSMethodDeclarationArg> nextMethodDeclarationArgList@<OCSMethodDeclarationArgList> ;\n"

#import "OCSMethodDeclarationArgList.h"
#import "OCSMethodDeclarationArg.h"

@implementation OCSMethodDeclarationArgList
{
    NSArray *_ocsMethodArgs;
}

- (NSArray *)ocsMethodArgs
{
    return _ocsMethodArgs;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodDeclarationArg *methodArg = [syntaxTree valueForTag:@"ocsDelarationArg"];
        OCSMethodDeclarationArgList *nextMethodList = [syntaxTree valueForTag:@"nextMethodDeclarationArgList"];
        
        NSMutableArray *argArray = [NSMutableArray arrayWithObject:methodArg];
        if (nextMethodList)
        {
            [argArray addObjectsFromArray:nextMethodList.ocsMethodArgs];
        }
        _ocsMethodArgs = [NSArray arrayWithArray:argArray];
    }
    return self;
}

@end
