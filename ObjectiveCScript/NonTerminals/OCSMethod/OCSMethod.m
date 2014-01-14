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
    NSString *_ocsMethodName;
    
    OCSMethodMetaType _ocsMethodMetaType;
    OCSMethodBody *_ocsMethodBody;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _ocsMethodName = @"";
        OCSMethodDeclaration *ocsMethodDeclaration = [syntaxTree valueForTag:@"methodDeclaration"];
        _ocsMethodMetaType = ocsMethodDeclaration.ocsMethodMetaType;
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
            _ocsMethodMetaType = ocsMethodMetaTypeNumber.intValue;
        }
        _ocsMethodBody = [aDecoder decodeObjectForKey:OCSMethodBodyArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:_ocsMethodMetaType]
                  forKey:OCSMethodDeclarationMetaTypeArchivedKey];
    if (_ocsMethodBody)
    {
        [aCoder encodeObject:_ocsMethodBody
                      forKey:OCSMethodBodyArchivedKey];
    }
}


@end
