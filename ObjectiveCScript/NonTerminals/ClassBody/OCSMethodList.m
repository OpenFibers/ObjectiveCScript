//
//  OCSMethodList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethodList.h"
#import "OCSMethod.h"

NSString *const OCSMethodListDeclaredMethodsArchivedKey = @"OCSMLDM";

@implementation OCSMethodList
{
    NSDictionary *_ocsDeclaredMethods;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        NSMutableDictionary *methods = [NSMutableDictionary dictionary];
        
        OCSMethod *firstMethod = [syntaxTree valueForTag:@"firstMethod"];
        OCSMethodList *nextMethodList = [syntaxTree valueForTag:@"nextMethodList"];
        
        if (firstMethod)
        {
            [methods setObject:firstMethod forKey:firstMethod.methodName];
        }
        if (nextMethodList)
        {
            for (NSString *eachMethodName in nextMethodList.ocsDeclaredMethods.allKeys)
            {
                [methods setObject:nextMethodList.ocsDeclaredMethods[eachMethodName]
                            forKey:eachMethodName];
            }
        }
        
        _ocsDeclaredMethods = [NSDictionary dictionaryWithDictionary:methods];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsDeclaredMethods = [aDecoder decodeObjectForKey:OCSMethodListDeclaredMethodsArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsDeclaredMethods)
    {
        [aCoder encodeObject:_ocsDeclaredMethods forKey:OCSMethodListDeclaredMethodsArchivedKey];
    }
}

@end
