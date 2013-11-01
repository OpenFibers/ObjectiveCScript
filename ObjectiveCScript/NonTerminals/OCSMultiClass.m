//
//  OCSMultiClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMultiClass.h"
#import "OCSClass.h"

#define NextMultiClassArchivedKey   @"NMC"
#define ClassArchivedKey            @"OCSC"

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
        self.ocsClass = [aDecoder decodeObjectForKey:ClassArchivedKey];
        self.nextOCSMultiClass = [aDecoder decodeObjectForKey:NextMultiClassArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.ocsClass forKey:ClassArchivedKey];
    [aCoder encodeObject:self.nextOCSMultiClass forKey:NextMultiClassArchivedKey];
}

@end
