//
//  OCSClassBody.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 28/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSClassBody.h"
#import "OCSMethodList.h"

NSString *const OCSClassBodyDeclaredMethodsArchivedKey = @"OCSCBDM";

@implementation OCSClassBody
{
    NSDictionary *_ocsDeclaredMethods;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodList *methodList = [syntaxTree valueForTag:@"methodList"];
        if (methodList)
        {
            _ocsDeclaredMethods = methodList.ocsDeclaredMethods;
        }
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsDeclaredMethods = [aDecoder decodeObjectForKey:OCSClassBodyDeclaredMethodsArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsDeclaredMethods)
    {
        [aCoder encodeObject:_ocsDeclaredMethods forKey:OCSClassBodyDeclaredMethodsArchivedKey];
    }
}

@end
