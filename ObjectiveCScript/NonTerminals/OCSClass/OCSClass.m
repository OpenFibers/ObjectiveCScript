//
//  OCSClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClass.h"
#import "OCSClassHeader.h"
#import "OCSClassBody.h"

NSString *const OCSClassHeaderArchivedKey   = @"OCSCH";
NSString *const OCSClassBodyArchivedKey     = @"OCSCB";

@interface OCSClass ()
@property (nonatomic, retain) OCSClassHeader *ocsClassHeader;
@property (nonatomic, retain) OCSClassBody *ocsClassBody;
@end

@implementation OCSClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClassHeader *ocsClassHeader = [syntaxTree valueForTag:@"classHeader"];
        self.ocsClassHeader = ocsClassHeader;
        
        OCSClassBody *ocsClassBody = [syntaxTree valueForTag:@"classBody"];
        if (ocsClassBody)
        {
            self.ocsClassBody = ocsClassBody;
        }
    }
    
    return self;
}

- (void)inject
{
    NSLog(@"%@ %@ %@ %@ %@", self.ocsClassHeader.ocsClassName, self.ocsClassHeader.ocsSuperClassName, self.ocsClassHeader.ocsProtocolList, self.ocsClassHeader.ocsMemberVariables, self.ocsClassBody);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClassHeader = [aDecoder decodeObjectForKey:OCSClassHeaderArchivedKey];
        self.ocsClassBody = [aDecoder decodeObjectForKey:OCSClassBodyArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.ocsClassHeader)
    {
        [aCoder encodeObject:self.ocsClassHeader forKey:OCSClassHeaderArchivedKey];
    }
    
    if (self.ocsClassBody)
    {
        [aCoder encodeObject:self.ocsClassBody forKey:OCSClassBodyArchivedKey];
    }
}

@end
