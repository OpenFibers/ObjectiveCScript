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

- (void)setOcsClassName:(NSString *)ocsClassName
{
    _ocsClassName = ocsClassName;
}

- (void)setOcsSuperClassName:(NSString *)ocsSuperClassName
{
    _ocsSuperClassName = ocsSuperClassName;
}

- (void)setOcsProtocolList:(NSArray *)ocsProtocolList
{
    _ocsProtocolList = ocsProtocolList;
}

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
    if (self.ocsClassName)
    {
        [aCoder encodeObject:self.ocsClassName forKey:OCSClassNameArchivedKey];
    }
    if (self.ocsSuperClassName)
    {
        [aCoder encodeObject:self.ocsSuperClassName forKey:OCSSuperClassNameArchivedKey];
    }
    if (self.ocsProtocolList)
    {
        [aCoder encodeObject:self.ocsProtocolList forKey:OCSProtocolListArchivedKey];
    }
}

@end
