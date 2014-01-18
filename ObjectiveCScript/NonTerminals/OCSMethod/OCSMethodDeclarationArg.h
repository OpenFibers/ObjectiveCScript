//
//  OCSMethodDeclarationArg.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSIdentifier.h"

@interface OCSMethodDeclarationArg : NSObject <CPParseResult>

@property (nonatomic, readonly) NSString *ocsMethodNamelet;//Part of method name
@property (nonatomic, readonly) OCSIdentifier *ocsIdentifier;//identifier of argument

@end
