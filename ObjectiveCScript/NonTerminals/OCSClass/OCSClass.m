//
//  OCSClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClass.h"
#import "OCSClassHeader.h"
#import "OCSIvarList.h"

#define OCSClassHeaderArchivedKey   @"OCSCH"
#define OCSClassIvarListArchivedKey @"OCSCIL"

@interface OCSClass ()
@property (nonatomic, retain) OCSClassHeader *ocsClassHeader;
@property (nonatomic, retain) OCSIvarList *ocsIvarList;
@end

@implementation OCSClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClassHeader *ocsClassHeader = [syntaxTree valueForTag:@"classHeader"];
        self.ocsClassHeader = ocsClassHeader;
        
        OCSIvarList *ocsIvarList = [syntaxTree valueForTag:@"ivarList"];
        self.ocsIvarList = ocsIvarList;
    }
    
    return self;
}

- (void)inject
{
    NSLog(@"%@ %@ %@ %@", self.ocsClassHeader.ocsClassName, self.ocsClassHeader.ocsSuperClassName, self.ocsClassHeader.ocsProtocolList, self.ocsIvarList.declaredIdentifiers);
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
    if (self.ocsClassHeader)
    {
        [aCoder encodeObject:self.ocsClassHeader forKey:OCSClassHeaderArchivedKey];
    }
}

@end
