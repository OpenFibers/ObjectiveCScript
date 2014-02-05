//
//  OCSExpression.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 5/2/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSExpression : NSObject <CPParseResult>

@property (nonatomic, readonly) NSNumber *number;

@end
