
//
//  OCSMethodType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSMethodType.h"

@implementation OCSMethodType
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
        if (syntaxTree.children.count > 0)
        {
            CPKeywordToken *keywordToken = syntaxTree.children[0];
            NSString *keyword = keywordToken.keyword;
            if ([keyword isEqualToString:@"+"])
            {
                _metaType = OCSMethodMetaTypeClass;
            }
            else if ([keyword isEqualToString:@"-"])
            {
                _metaType = OCSMethodMetaTypeInstance;
            }
            else
            {
                NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
            }
        }
        else
        {
            NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
        }
    }
    
    return self;
}

@end
