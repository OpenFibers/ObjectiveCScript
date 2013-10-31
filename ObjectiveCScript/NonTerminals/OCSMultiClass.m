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
@property (nonatomic, retain) OCSMultiClass *nextMultiClass;

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
            self.nextMultiClass = nextMultiClass;
        }
    }
    
    return self;
}

- (void)inject
{
    [self.ocsClass inject];
    [self.nextMultiClass inject];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsClass = [aDecoder decodeObjectForKey:ClassArchivedKey];
        self.nextMultiClass = [aDecoder decodeObjectForKey:NextMultiClassArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.ocsClass forKey:ClassArchivedKey];
    [aCoder encodeObject:self.nextMultiClass forKey:NextMultiClassArchivedKey];
}

@end
