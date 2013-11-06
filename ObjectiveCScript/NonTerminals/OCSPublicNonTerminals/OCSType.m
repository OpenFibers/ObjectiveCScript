//
//  OCSType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/7/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSType.h"

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
        CPIdentifierToken *identifierToken = [syntaxTree valueForTag:@"customType"];
        if (identifierToken)
        {
            _ocsTypeString = identifierToken.identifier;
            _ocsMetaType = OCSMetaTypeCustom;
        }
        else if (syntaxTree.children.count > 0)
        {
            CPKeywordToken *keywordToken = syntaxTree.children[0];
            _ocsTypeString = keywordToken.keyword;
            _ocsMetaType = ([_ocsTypeString isEqualToString:@"id"] ?
                            OCSMetaTypeId :
                            OCSMetaTypeC);
        }
        else
        {
            NSAssert(0, @"OCSType hasn't been normally inited.");
        }
    }
    
    return self;
}

@end
