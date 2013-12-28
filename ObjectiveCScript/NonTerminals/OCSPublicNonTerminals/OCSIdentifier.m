//
//  OCSIdentifier.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. view | *view | **someInt

#import "OCSIdentifier.h"

NSString *const OCSIdentifierName               = @"OCSIN";
NSString *const OCSIdentifierPointerCount       = @"OCSPC";
NSString *const OCSIdentifierType               = @"OCST";
NSString *const OCSIdentifierMetaType           = @"OCSMT";


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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsIdentifierName = [aDecoder decodeObjectForKey:OCSIdentifierName];
        NSNumber *pointerCountNumber = [aDecoder decodeObjectForKey:OCSIdentifierPointerCount];
        _pointerCount = pointerCountNumber.intValue;
        self.typeString = [aDecoder decodeObjectForKey:OCSIdentifierType];
        NSNumber *metaTypeNumber = [aDecoder decodeObjectForKey:OCSIdentifierMetaType];
        self.metaType = metaTypeNumber.intValue;
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsIdentifierName)
    {
        [aCoder encodeObject:_ocsIdentifierName forKey:OCSIdentifierName];
    }
    [aCoder encodeObject:[NSNumber numberWithUnsignedInt:_pointerCount] forKey:OCSIdentifierPointerCount];
    if (self.typeString)
    {
        [aCoder encodeObject:self.typeString forKey:OCSIdentifierType];
    }
    [aCoder encodeObject:[NSNumber numberWithInt:self.metaType] forKey:OCSIdentifierMetaType];
}

@end
