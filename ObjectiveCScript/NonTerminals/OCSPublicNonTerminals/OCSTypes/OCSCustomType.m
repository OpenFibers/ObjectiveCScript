//
//  OCSCustomType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSCustomType.h"

@implementation OCSCustomType
{
    NSString *_ocsTypeString;
}

- (NSString *)ocsTypeString
{
    return _ocsTypeString;
}

- (OCSMetaType)ocsMetaType
{
    return OCSMetaTypeCustom;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        if (syntaxTree.children.count > 0)
        {
            CPIdentifierToken *keywordToken = syntaxTree.children[0];
            _ocsTypeString = keywordToken.identifier;
        }
        else
        {
            NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
        }
    }
    
    return self;
}

@end
