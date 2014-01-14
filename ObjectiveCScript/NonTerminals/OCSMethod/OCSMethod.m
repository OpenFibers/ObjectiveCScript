//
//  OCSMethod.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMethod.h"
#import "OCSMethodDeclaration.h"
#import "OCSMethodBody.h"

NSString *const OCSMethodDeclarationMetaTypeArchivedKey     = @"OCSMDMT";
NSString *const OCSMethodBodyArchivedKey                    = @"OCSMB";

@implementation OCSMethod
{
    NSString *_methodName;
    
    OCSMethodMetaType _metaType;
    OCSMethodBody *_ocsMethodBody;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _methodName = @"";
        OCSMethodDeclaration *ocsMethodDeclaration = [syntaxTree valueForTag:@"methodDeclaration"];
        _metaType = ocsMethodDeclaration.metaType;
        _ocsMethodBody = [syntaxTree valueForTag:@"methodBody"];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        NSNumber *ocsMethodMetaTypeNumber = [aDecoder decodeObjectForKey:OCSMethodDeclarationMetaTypeArchivedKey];
        if (ocsMethodMetaTypeNumber)
        {
            _metaType = ocsMethodMetaTypeNumber.intValue;
        }
        _ocsMethodBody = [aDecoder decodeObjectForKey:OCSMethodBodyArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:_metaType]
                  forKey:OCSMethodDeclarationMetaTypeArchivedKey];
    if (_ocsMethodBody)
    {
        [aCoder encodeObject:_ocsMethodBody
                      forKey:OCSMethodBodyArchivedKey];
    }
}


@end
