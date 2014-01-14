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

@interface OCSMethod : NSObject <CPParseResult, NSCoding>

@property (nonatomic, readonly) NSString *methodName;
@property (nonatomic, readonly) OCSMethodMetaType metaType;

@end
