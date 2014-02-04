//
//  OCSSum.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 1/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSSum : NSObject <CPParseResult>

@property (nonatomic, readonly) NSNumber *number;

@end
