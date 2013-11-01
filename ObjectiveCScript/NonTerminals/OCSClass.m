//
//  OCSClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClass.h"
#import "OCSClassHeader.h"

@interface OCSClass ()
@property (nonatomic, retain) OCSClassHeader *ocsClassHeader;
@end

@implementation OCSClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClassHeader *ocsClassHeader = [syntaxTree valueForTag:@"classHeader"];
        self.ocsClassHeader = ocsClassHeader;
    }
    
    return self;
}

- (void)inject
{
    NSLog(@"%@ %@", self.ocsClassHeader.ocsClassName, self.ocsClassHeader.ocsSuperClassName);
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}

@end
