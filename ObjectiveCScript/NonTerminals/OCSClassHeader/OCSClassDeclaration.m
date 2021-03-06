//
//  OCSClassHeader.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassDeclaration.h"
#import "OCSProtocolListWithBrackets.h"

NSString *const OCSClassNameArchivedKey         = @"OCSCN";
NSString *const OCSSuperClassNameArchivedKey    = @"OCSSCN";
NSString *const OCSProtocolListArchivedKey      = @"OCSPL";

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
        OCSProtocolListWithBrackets *protocolList = [syntaxTree valueForTag:@"protocolList"];
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
            self.ocsProtocolList = protocolList.ocsProtocols;
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
