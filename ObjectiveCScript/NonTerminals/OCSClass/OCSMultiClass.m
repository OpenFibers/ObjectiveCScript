//
//  OCSMultiClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMultiClass.h"
#import "OCSClass.h"

NSString *const OCSNextMultiClassArchivedKey    = @"OCSNMC";
NSString *const OCSClassArchivedKey             = @"OCSC";

@interface OCSMultiClass()

@property (nonatomic, retain) OCSClass *ocsClass;
@property (nonatomic, retain) OCSMultiClass *nextOCSMultiClass;

@end

@implementation OCSMultiClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClass *ocsClass = [syntaxTree valueForTag:@"class"];
        OCSMultiClass *nextMultiClass = [syntaxTree valueForTag:@"multiclass"];
        
        if (ocsClass)
        {
            self.ocsClass = ocsClass;
        }
        
        if (nextMultiClass)
        {
            self.nextOCSMultiClass = nextMultiClass;
        }
    }
    
    return self;
}

- (void)inject
{
    [self.ocsClass inject];
    [self.nextOCSMultiClass inject];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClass = [aDecoder decodeObjectForKey:OCSClassArchivedKey];
        self.nextOCSMultiClass = [aDecoder decodeObjectForKey:OCSNextMultiClassArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.ocsClass)
    {
        [aCoder encodeObject:self.ocsClass forKey:OCSClassArchivedKey];
    }
    if (self.nextOCSMultiClass)
    {
        [aCoder encodeObject:self.nextOCSMultiClass forKey:OCSNextMultiClassArchivedKey];
    }
}

@end
