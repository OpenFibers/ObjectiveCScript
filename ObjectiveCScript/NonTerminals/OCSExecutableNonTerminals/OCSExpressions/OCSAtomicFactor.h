//
//  OCSAtomicFactor.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSAtomicFactor : NSObject <CPParseResult>

@property (nonatomic, readonly) NSNumber *number;

@end
