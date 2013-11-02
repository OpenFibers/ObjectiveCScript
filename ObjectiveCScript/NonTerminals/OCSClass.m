//
//  OCSClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClass.h"
#import "OCSClassDeclaration.h"

#define OCSClassHeaderArchivedKey   @"OCSCH"

@interface OCSClass ()
@property (nonatomic, retain) OCSClassDeclaration *ocsClassHeader;
@end

@implementation OCSClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClassDeclaration *ocsClassHeader = [syntaxTree valueForTag:@"classHeader"];
        self.ocsClassHeader = ocsClassHeader;
    }
    
    return self;
}

- (void)inject
{
    NSLog(@"%@ %@ %@", self.ocsClassHeader.ocsClassName, self.ocsClassHeader.ocsSuperClassName, self.ocsClassHeader.ocsProtocolList);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClassHeader = [aDecoder decodeObjectForKey:OCSClassHeaderArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.ocsClassHeader forKey:OCSClassHeaderArchivedKey];
}

@end
