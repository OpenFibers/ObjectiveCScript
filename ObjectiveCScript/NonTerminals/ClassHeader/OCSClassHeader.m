//
//  OCSClassHeader.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/3/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassHeader.h"
#import "OCSClassDeclaration.h"
#import "OCSIvarList.h"

NSString *const OCSClassDeclarationArchivedKey  = @"OCSCD";
NSString *const OCSIvarListArchivedKey          = @"OCSIL";

@interface OCSClassHeader ()

@property (nonatomic, retain) OCSClassDeclaration *ocsClassDeclaration;
@property (nonatomic, retain) OCSIvarList *ocsIvarList;

@end

@implementation OCSClassHeader

- (NSString *)ocsClassName
{
    return self.ocsClassDeclaration.ocsClassName;
}

- (NSString *)ocsSuperClassName
{
    return self.ocsClassDeclaration.ocsSuperClassName;
}

- (NSArray *)ocsProtocolList
{
    return self.ocsClassDeclaration.ocsProtocolList;
}

- (NSDictionary *)ocsMemberVariables
{
    return self.ocsIvarList.ocsDeclaredIdentifiers;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClassDeclaration *ocsClassDeclaration = [syntaxTree valueForTag:@"classDeclaration"];
        self.ocsClassDeclaration = ocsClassDeclaration;
        
        OCSIvarList *ocsIvarList = [syntaxTree valueForTag:@"ocsIvarList"];
        self.ocsIvarList = ocsIvarList;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClassDeclaration = [aDecoder decodeObjectForKey:OCSClassDeclarationArchivedKey];
        self.ocsIvarList = [aDecoder decodeObjectForKey:OCSIvarListArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.ocsClassDeclaration)
    {
        [aCoder encodeObject:self.ocsClassDeclaration forKey:OCSClassDeclarationArchivedKey];
    }
    if (self.ocsIvarList)
    {
        [aCoder encodeObject:self.ocsIvarList forKey:OCSIvarListArchivedKey];
    }
}

@end
