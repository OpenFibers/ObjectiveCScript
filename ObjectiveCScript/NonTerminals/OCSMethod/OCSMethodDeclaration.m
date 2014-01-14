//
//  OCSMethodDeclaration.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethodDeclaration.h"
#import "OCSMethodType.h"

@implementation OCSMethodDeclaration
{
    OCSMethodMetaType _ocsMethodMetaType;
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
    }
    return self;
}

@end
