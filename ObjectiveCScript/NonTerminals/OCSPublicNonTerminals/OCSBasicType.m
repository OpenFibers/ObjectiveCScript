//
//  OCSBasicType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSBasicType.h"

@implementation OCSBasicType
{
    NSString *_ocsTypeString;
}

- (NSString *)ocsTypeString
{
    return _ocsTypeString;
}

- (OCSMetaType)ocsMetaType
{
    return OCSMetaTypeC;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        if (syntaxTree.children.count > 0)
        {
            CPKeywordToken *keywordToken = syntaxTree.children[0];
            _ocsTypeString = keywordToken.keyword;
        }
        else
        {
            NSAssert(0, @"OCSBasicType hasn't been normally inited.");
        }
    }
    
    return self;
}

@end
