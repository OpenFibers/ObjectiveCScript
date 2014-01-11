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

NSString *const OCSMethodDeclarationArchivedKey     = @"OCSMLDM";
NSString *const OCSMethodBodyArchivedKey            = @"OCSMLDM";

@implementation OCSMethod
{
    NSString *_methodName;
    OCSMethodDeclaration *_ocsMethodDeclaration;
    OCSMethodBody *_ocsMethodBody;
}

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    if (nil != self)
    {
        _methodName = @"";
        _ocsMethodDeclaration = [syntaxTree valueForTag:@"methodDeclaration"];
        _ocsMethodBody = [syntaxTree valueForTag:@"methodBody"];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ocsMethodDeclaration = [aDecoder decodeObjectForKey:OCSMethodDeclarationArchivedKey];
        _ocsMethodBody = [aDecoder decodeObjectForKey:OCSMethodBodyArchivedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (_ocsMethodDeclaration)
    {
        [aCoder encodeObject:_ocsMethodDeclaration forKey:OCSMethodDeclarationArchivedKey];
    }
    if (_ocsMethodBody)
    {
        [aCoder encodeObject:_ocsMethodBody forKey:OCSMethodBodyArchivedKey];
    }
}


@end
