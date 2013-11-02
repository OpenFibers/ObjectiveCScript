//
//  OCSClassHeader.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassDeclaration.h"
#import "OCSProtocolList.h"

#define OCSClassNameArchivedKey         @"OCSCN"
#define OCSSuperClassNameArchivedKey    @"OCSSCN"
#define OCSProtocolListArchivedKey      @"OCSPL"

@implementation OCSClassDeclaration

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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClassName = [aDecoder decodeObjectForKey:OCSClassNameArchivedKey];
        self.ocsSuperClassName = [aDecoder decodeObjectForKey:OCSSuperClassNameArchivedKey];
        self.ocsProtocolList = [aDecoder decodeObjectForKey:OCSProtocolListArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.ocsClassName forKey:OCSClassNameArchivedKey];
    [aCoder encodeObject:self.ocsSuperClassName forKey:OCSSuperClassNameArchivedKey];
    [aCoder encodeObject:self.ocsProtocolList forKey:OCSProtocolListArchivedKey];
}

@end
