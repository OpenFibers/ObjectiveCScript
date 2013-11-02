//
//  OCSFile.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSFile.h"
#import "OCSMultiClass.h"

#define OCSMultiClassArchivedKey   @"OCSMC"

@interface OCSFile ()
@property (nonatomic, retain) OCSMultiClass *ocsMultiClass;
@end

@implementation OCSFile

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSMultiClass *multiClass = [syntaxTree valueForTag:@"multiclass"];
        if (multiClass)
        {
            self.ocsMultiClass = multiClass;
        }
    }
    
    return self;
}

- (void)inject
{
    [self.ocsMultiClass inject];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.ocsMultiClass = [aDecoder decodeObjectForKey:OCSMultiClassArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.ocsMultiClass)
    {
        [aCoder encodeObject:self.ocsMultiClass forKey:OCSMultiClassArchivedKey];
    }
}

- (NSData *)archivedData
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return data;
}

@end
