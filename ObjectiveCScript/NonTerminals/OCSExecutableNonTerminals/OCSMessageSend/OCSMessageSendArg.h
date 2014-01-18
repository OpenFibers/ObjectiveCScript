//
//  OCSMessageSendArg.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSReturnableFactor.h"

@interface OCSMessageSendArg : NSObject <CPParseResult>

@property (nonatomic, readonly) NSString *ocsMethodNamelet;
@property (nonatomic, readonly) OCSReturnableFactor *ocsReturnableFactor;

@end
