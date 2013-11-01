//
//  OCSClassHeader.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassHeader.h"
#import "OCSProtocolList.h"

@implementation OCSClassHeader

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        CPIdentifierToken *classNameToken = [syntaxTree valueForTag:@"className"];
        CPIdentifierToken *superClassNameToken = [syntaxTree valueForTag:@"superClassName"];
        OCSProtocolList *protocolList = [syntaxTree valueForTag:@"protocolList"];
        if (classNameToken)
        {
            self.ocsClassName = classNameToken.identifier;
        }
        if (superClassNameToken)
        {
            self.ocsSuperClassName = superClassNameToken.identifier;
        }
        if (protocolList)
        {
            self.ocsProtocolList = protocolList.protocols;
        }
    }
    
    return self;
}

@end
