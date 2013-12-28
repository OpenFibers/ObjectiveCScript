//
//  OCSClassBody.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 28/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassBody.h"
#import "OCSMethodList.h"

NSString *const OCSClassBodyDeclaredMethods = @"OCSCBDM";

@implementation OCSClassBody
{
    NSDictionary *_declaredMethods;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodList *methodList = [syntaxTree valueForTag:@"methodList"];
        if (methodList)
        {
            _declaredMethods = methodList.declaredMethods;
        }
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _declaredMethods = [aDecoder decodeObjectForKey:OCSClassBodyDeclaredMethods];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_declaredMethods)
    {
        [aCoder encodeObject:_declaredMethods forKey:OCSClassBodyDeclaredMethods];
    }
}

@end
