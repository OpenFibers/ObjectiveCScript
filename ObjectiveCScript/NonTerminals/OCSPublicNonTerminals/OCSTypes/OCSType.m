//
//  OCSType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/7/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSType.h"
#import "OCSBasicType.h"
#import "OCSCustomType.h"
#import "OCSIDType.h"

@implementation OCSType
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
        OCSCustomType *identifierToken = [syntaxTree valueForTag:@"ocsCustomType"];
        OCSBasicType *basicTypeToken = [syntaxTree valueForTag:@"ocsBasicType"];
        OCSIDType *ocsIDTypeToken = [syntaxTree valueForTag:@"ocsIDType"];
        if (identifierToken)
        {
            _ocsTypeString = identifierToken.ocsTypeString;
            _ocsMetaType = identifierToken.ocsMetaType;
        }
        else if(basicTypeToken)
        {
            _ocsTypeString = basicTypeToken.ocsTypeString;
            _ocsMetaType = basicTypeToken.ocsMetaType;
        }
        else if (ocsIDTypeToken)
        {
            _ocsTypeString = ocsIDTypeToken.ocsTypeString;
            _ocsMetaType = ocsIDTypeToken.ocsMetaType;
        }
        else
        {
            NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
        }
    }
    
    return self;
}

@end
