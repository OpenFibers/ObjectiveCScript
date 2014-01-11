//
//  OCSPointerList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 12/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMetaType.h"

@interface OCSPointerList : NSObject <CPParseResult>

@property (nonatomic, readonly) NSUInteger ocsPointerCount;

@end
