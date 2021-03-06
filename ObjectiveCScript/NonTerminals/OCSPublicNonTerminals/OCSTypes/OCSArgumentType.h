//
//  OCSArgumentType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 12/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//
//  Return type, method's argument type, and casts
//  Always in parenthesis
//  e.g. (void) (int) (int *) (id) (UIView *) (NSError **)

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMetaType.h"

@interface OCSArgumentType : NSObject <CPParseResult, NSCoding>

@property (nonatomic, readonly) NSString *ocsTypeString;
@property (nonatomic, readonly) OCSMetaType ocsMetaType;
@property (nonatomic, readonly) long ocsPointerCount;

@end
