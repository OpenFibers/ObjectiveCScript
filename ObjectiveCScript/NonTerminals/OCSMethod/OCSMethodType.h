//
//  OCSMethodType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMethodMetaType.h"

@interface OCSMethodType : NSObject <CPParseResult>

@property (nonatomic, readonly) OCSMethodMetaType ocsMethodMetaType;

@end
