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
    OCSMethodMetaType _ocsMethodMetaType;
    OCSArgumentType *_ocsMethodReturnType;
    NSString *_ocsMethodName;
    NSDictionary *_ocsMethodArguments;
    
    OCSMethodBody *_ocsMethodBody;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        OCSMethodDeclaration *ocsMethodDeclaration = [syntaxTree valueForTag:@"methodDeclaration"];
        _ocsMethodMetaType = ocsMethodDeclaration.ocsMethodMetaType;
        _ocsMethodReturnType = ocsMethodDeclaration.ocsMethodReturnType;
        _ocsMethodName = ocsMethodDeclaration.ocsMethodName;
        _ocsMethodArguments = ocsMethodDeclaration.ocsMethodArguments;
        
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
