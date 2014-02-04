//
//  OCSEqualityResult.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 3/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSEqualityResult : NSObject <CPParseResult>

@property (nonatomic, readonly) NSNumber *number;

@end
