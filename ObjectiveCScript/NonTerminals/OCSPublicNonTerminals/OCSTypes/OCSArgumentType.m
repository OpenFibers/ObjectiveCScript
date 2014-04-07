//
//  OCSArgumentType.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 12/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "OCSArgumentType.h"
#import "OCSType.h"
#import "OCSPointerList.h"

NSString *const OCSArgumentTypeTypeStringArchivedKey    = @"OCSATTS";
NSString *const OCSArgumentTypeMetaTypeArchivedKey      = @"OCSATMT";
NSString *const OCSArgumentTypePointerCountArchivedKey  = @"OCSATPC";

@implementation OCSArgumentType
{
    NSString *_ocsTypeString;
    OCSMetaType _ocsMetaType;
    long _ocsPointerCount;
}

- (NSString *)ocsTypeString
{
    return _ocsTypeString;
}

- (OCSMetaType)ocsMetaType
{
    return _ocsMetaType;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSType *ocsTypeToken = [syntaxTree valueForTag:@"ocsType"];
        if (ocsTypeToken)
        {
            _ocsTypeString = ocsTypeToken.ocsTypeString;
            _ocsMetaType = ocsTypeToken.ocsMetaType;
        }
        else
        {
            NSAssert(0, @"%@ hasn't been normally inited.", NSStringFromClass(self.class));
        }
        
        OCSPointerList *pointerList = [syntaxTree valueForTag:@"ocsPointerList"];
        if (pointerList)
        {
            _ocsPointerCount = pointerList.ocsPointerCount;
        }
    }
    
    return self;
}

- (NSString *)description
{
    NSString *metaTypeString = @"";
    switch (self.ocsMetaType)
    {
        case OCSMetaTypeVoid:
            metaTypeString = @"OCSMetaTypeVoid";
            break;
        case OCSMetaTypeCustom:
            metaTypeString = @"OCSMetaTypeCustom";
            break;
        case OCSMetaTypeBasic:
            metaTypeString = @"OCSMetaTypeBasic";
            break;
        case OCSMetaTypeId:
            metaTypeString = @"OCSMetaTypeId";
            break;
        default:
            break;
    }

    return [NSString stringWithFormat:@"%@, type: %@, pointer count: %lu, meta type: %@",
            [super description],
            self.ocsTypeString,
            (unsigned long)self.ocsPointerCount,
            metaTypeString];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        NSNumber *ocsArgumentTypeMetaTypeNumber = [aDecoder decodeObjectForKey:OCSArgumentTypeMetaTypeArchivedKey];
        if (ocsArgumentTypeMetaTypeNumber)
        {
            _ocsMetaType = ocsArgumentTypeMetaTypeNumber.intValue;
        }
        
        NSNumber *ocsArgumentTypePointerCountNumber = [aDecoder decodeObjectForKey:OCSArgumentTypePointerCountArchivedKey];
        if (ocsArgumentTypePointerCountNumber)
        {
            _ocsPointerCount = ocsArgumentTypePointerCountNumber.longValue;
        }
        
        _ocsTypeString = [aDecoder decodeObjectForKey:OCSArgumentTypeTypeStringArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:_ocsMetaType]
                  forKey:OCSArgumentTypeMetaTypeArchivedKey];
    [aCoder encodeObject:[NSNumber numberWithLong:_ocsPointerCount]
                  forKey:OCSArgumentTypePointerCountArchivedKey];
    if (_ocsTypeString)
    {
        [aCoder encodeObject:_ocsTypeString
                      forKey:OCSArgumentTypeTypeStringArchivedKey];
    }
}

@end
