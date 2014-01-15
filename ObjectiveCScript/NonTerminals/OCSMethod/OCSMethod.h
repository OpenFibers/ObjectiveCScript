//
//  OCSMethod.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 29/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMethodMetaType.h"
#import "OCSArgumentType.h"

@interface OCSMethod : NSObject <CPParseResult, NSCoding>

//Class method or instance method
@property (nonatomic, readonly) OCSMethodMetaType ocsMethodMetaType;

//Return type
@property (nonatomic, readonly) OCSArgumentType *ocsMethodReturnType;

//Method name in string
@property (nonatomic, readonly) NSString *ocsMethodName;

//Member variables
//Each key of `ocsMethodArguments` is a `OCSIdentifier`'s identifier name.
//Each object of `ocsMethodArguments` is a `OCSIdentifier`
@property (nonatomic, readonly) NSDictionary *ocsMethodArguments;


@end
