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

NSString *const OCSMethodMetaTypeArchivedKey        = @"OCSMMT";
NSString *const OCSMethodReturnTypeArchivedKey      = @"OCSMRT";
NSString *const OCSMethodNameArchivedKey            = @"OCSMN";
NSString *const OCSMethodArgumentsArchivedKey       = @"OCSMA";
NSString *const OCSMethodBodyArchivedKey            = @"OCSMB";

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

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ return type:%@, method name:%@, arguments:%@",
            [super description],
            self.ocsMethodReturnType,
            self.ocsMethodName,
            self.ocsMethodArguments];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        NSNumber *ocsMethodMetaTypeNumber = [aDecoder decodeObjectForKey:OCSMethodMetaTypeArchivedKey];
        if (ocsMethodMetaTypeNumber)
        {
            _ocsMethodMetaType = ocsMethodMetaTypeNumber.intValue;
        }
        _ocsMethodReturnType = [aDecoder decodeObjectForKey:OCSMethodReturnTypeArchivedKey];
        _ocsMethodName = [aDecoder decodeObjectForKey:OCSMethodNameArchivedKey];
        _ocsMethodArguments = [aDecoder decodeObjectForKey:OCSMethodArgumentsArchivedKey];
        _ocsMethodBody = [aDecoder decodeObjectForKey:OCSMethodBodyArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:_ocsMethodMetaType]
                  forKey:OCSMethodMetaTypeArchivedKey];
    if (_ocsMethodReturnType)
    {
        [aCoder encodeObject:_ocsMethodReturnType
                      forKey:OCSMethodReturnTypeArchivedKey];
    }
    if (_ocsMethodName)
    {
        [aCoder encodeObject:_ocsMethodName
                      forKey:OCSMethodNameArchivedKey];
    }
    if (_ocsMethodArguments)
    {
        [aCoder encodeObject:_ocsMethodArguments
                      forKey:OCSMethodArgumentsArchivedKey];
    }
    if (_ocsMethodBody)
    {
        [aCoder encodeObject:_ocsMethodBody
                      forKey:OCSMethodBodyArchivedKey];
    }
}


@end
