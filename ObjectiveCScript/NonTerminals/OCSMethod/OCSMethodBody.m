//
//  OCSMethodBody.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethodBody.h"
#import "OCSCodeScope.h"

#warning unfinished NSCoding methods

@implementation OCSMethodBody
{
    OCSCodeScope *_ocsCodeScope;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _ocsCodeScope = [syntaxTree valueForTag:@""];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}

@end
