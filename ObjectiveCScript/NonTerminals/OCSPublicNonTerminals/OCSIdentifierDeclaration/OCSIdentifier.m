//
//  OCSIdentifier.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. view | *view | **someInt

#import "OCSIdentifier.h"
#import "OCSPointerList.h"

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

- (id)initWithIdentifierName:(NSString *)identifierName
                pointerCount:(NSUInteger)pointerCount
                  typeString:(NSString *)typeString
                    metaType:(OCSMetaType)metaType
{
    self = [self init];
    if (self)
    {
        _ocsIdentifierName = identifierName;
        _ocsPointerCount = pointerCount;
        self.ocsTypeString = typeString;
        self.ocsMetaType = metaType;
    }
    return self;
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
        
        OCSPointerList *pointerList = [syntaxTree valueForTag:@"ocsPointerList"];
        if (pointerList)
        {
            _ocsPointerCount = pointerList.ocsPointerCount;
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

- (NSString *)description
{
    return [[super description] stringByAppendingFormat:@", %@, %@, %d", self.ocsTypeString,  self.ocsIdentifierName, self.ocsPointerCount];
}

@end
