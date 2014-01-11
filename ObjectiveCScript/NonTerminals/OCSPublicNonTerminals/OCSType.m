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
        if (identifierToken)
        {
            _ocsTypeString = identifierToken.ocsTypeString;
            _ocsMetaType = OCSMetaTypeCustom;
        }
        else if(basicTypeToken)
        {
            _ocsTypeString = basicTypeToken.ocsTypeString;
            _ocsMetaType = OCSMetaTypeC;
        }
        else if (syntaxTree.children.count > 0)
        {
            CPKeywordToken *keywordToken = syntaxTree.children[0];
            _ocsTypeString = keywordToken.keyword;
            if (![keywordToken.keyword isEqualToString:@"id"])
            {
                NSAssert(0, @"OCSType hasn't been normally inited.");
            }
            _ocsMetaType = OCSMetaTypeId;
        }
        else
        {
            NSAssert(0, @"OCSType hasn't been normally inited.");
        }
    }
    
    return self;
}

@end
