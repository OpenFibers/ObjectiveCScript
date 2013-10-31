//
//  OCSFile.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSFile.h"
#import "OCSMultiClass.h"

#define MultiClassArchivedKey   @"MC"

@interface OCSFile ()
@property (nonatomic, retain) OCSMultiClass *multiClass;
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
            self.multiClass = multiClass;
        }
    }
    
    return self;
}

- (void)inject
{
    [self.multiClass inject];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.multiClass = [aDecoder decodeObjectForKey:MultiClassArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.multiClass forKey:MultiClassArchivedKey];
}

- (NSData *)archivedData
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return data;
}

@end
