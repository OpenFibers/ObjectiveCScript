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
    NSUInteger _ocsPointerCount;
}

- (NSUInteger)ocsPointerCount
{
    return _ocsPointerCount;
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
            _ocsPointerCount = 0;
        }
        else
        {
            _ocsPointerCount = nextOCSIdentifier.ocsPointerCount + 1;
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
        _ocsPointerCount = pointerCountNumber.intValue;
        self.ocsTypeString = [aDecoder decodeObjectForKey:OCSIdentifierType];
        NSNumber *metaTypeNumber = [aDecoder decodeObjectForKey:OCSIdentifierMetaType];
        self.ocsMetaType = metaTypeNumber.intValue;
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsIdentifierName)
    {
        [aCoder encodeObject:_ocsIdentifierName forKey:OCSIdentifierName];
    }
    [aCoder encodeObject:[NSNumber numberWithUnsignedInt:_ocsPointerCount] forKey:OCSIdentifierPointerCount];
    if (self.ocsTypeString)
    {
        [aCoder encodeObject:self.ocsTypeString forKey:OCSIdentifierType];
    }
    [aCoder encodeObject:[NSNumber numberWithInt:self.ocsMetaType] forKey:OCSIdentifierMetaType];
}

@end
