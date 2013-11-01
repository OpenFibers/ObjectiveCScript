//
//  OCSClassProtocolList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSProtocolList.h"

@implementation OCSProtocolList

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
//        CPIdentifierToken *classNameToken = [syntaxTree valueForTag:@"className"];
//        CPIdentifierToken *superClassNameToken = [syntaxTree valueForTag:@"superClassName"];
//        if (classNameToken)
//        {
//            self.ocsClassName = classNameToken.identifier;
//        }
//        if (superClassNameToken)
//        {
//            self.ocsSuperClassName = superClassNameToken.identifier;
//        }
    }
    
    return self;
}

@end
