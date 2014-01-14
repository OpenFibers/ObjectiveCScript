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
    OCSMethodMetaType _metaType;
}

- (OCSMethodMetaType)metaType
{
    return _metaType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodType *ocsMethodType = [syntaxTree valueForTag:@"ocsMethodType"];
        _metaType = ocsMethodType.metaType;
    }
    return self;
}

@end
