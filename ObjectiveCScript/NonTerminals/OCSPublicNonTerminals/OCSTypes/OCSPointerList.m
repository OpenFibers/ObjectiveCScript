//
//  OCSPointerList.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 12/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSPointerList.h"

@implementation OCSPointerList
{
    NSUInteger _ocsPointerCount;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _ocsPointerCount = 1;
        OCSPointerList *nextPointerList = [syntaxTree valueForTag:@"nextPointerList"];
        if (nextPointerList)
        {
            _ocsPointerCount += nextPointerList.ocsPointerCount;
        }
    }
    return self;
}

@end
