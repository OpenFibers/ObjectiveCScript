//
//  OCSArgumentType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 12/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSArgumentType.h"
#import "OCSType.h"

@implementation OCSArgumentType


{
    NSString *_ocsTypeString;
    OCSMetaType _ocsMetaType;
}

- (NSString *)ocsTypeString
{
    return _ocsTypeString;
}

- (OCSMetaType)ocsMetaType
{
    return _ocsMetaType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSType *ocsTypeToken = [syntaxTree valueForTag:@"ocsType"];
        if (ocsTypeToken)
        {
            _ocsTypeString = ocsTypeToken.ocsTypeString;
            _ocsMetaType = ocsTypeToken.ocsMetaType;
        }
        else
        {
            NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
        }
    }
    
    return self;
}

@end
