//
//  OCSMethodList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethodList.h"
#import "OCSMethod.h"

NSString *const OCSMethodListDeclaredMethods = @"OCSMLDM";

@implementation OCSMethodList
{
    NSDictionary *_declaredMethods;
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
            for (NSString *eachMethodName in nextMethodList.declaredMethods.allKeys)
            {
                [methods setObject:nextMethodList.declaredMethods[eachMethodName]
                            forKey:eachMethodName];
            }
        }
        
        _declaredMethods = [NSDictionary dictionaryWithDictionary:methods];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _declaredMethods = [aDecoder decodeObjectForKey:OCSMethodListDeclaredMethods];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_declaredMethods)
    {
        [aCoder encodeObject:_declaredMethods forKey:OCSMethodListDeclaredMethods];
    }
}

@end
