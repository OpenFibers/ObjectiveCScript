//
//  OCSIdentifier.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. view | *view | **someInt

#import "OCSIdentifier.h"

@implementation OCSIdentifier
{
    NSString *_ocsIdentifierName;
    NSUInteger _pointerCount;
}

- (NSUInteger)pointerCount
{
    return _pointerCount;
}

- (NSString *)ocsIdentifierName
{
    return _ocsIdentifierName;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        CPIdentifierToken *identifierToken = [syntaxTree valueForTag:@"identifier"];
        if (identifierToken)
        {
            _ocsIdentifierName = identifierToken.identifier;
        }
        
        OCSIdentifier *nextOCSIdentifier = [syntaxTree valueForTag:@"nextOCSIdentifier"];
        if (!nextOCSIdentifier)
        {
            _pointerCount = 0;
        }
        else
        {
            _pointerCount = nextOCSIdentifier.pointerCount + 1;
            _ocsIdentifierName = nextOCSIdentifier.ocsIdentifierName;
        }
    }
    
    return self;
}

@end
