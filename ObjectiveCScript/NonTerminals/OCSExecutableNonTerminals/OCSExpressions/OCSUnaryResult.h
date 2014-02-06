//
//  OCSUnaryResult.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 6/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSUnaryResult : NSObject <CPParseResult>

@property (nonatomic, readonly) NSNumber *number;

@end
