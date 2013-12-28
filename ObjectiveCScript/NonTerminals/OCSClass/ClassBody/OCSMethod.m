//
//  OCSMethod.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethod.h"

@implementation OCSMethod
{
    NSString *_methodName;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _methodName = @"";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
//        _declaredMethods = [aDecoder decodeObjectForKey:OCSMethodListDeclaredMethods];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
//    if (_declaredMethods)
//    {
//        [aCoder encodeObject:_declaredMethods forKey:OCSMethodListDeclaredMethods];
//    }
}


@end
