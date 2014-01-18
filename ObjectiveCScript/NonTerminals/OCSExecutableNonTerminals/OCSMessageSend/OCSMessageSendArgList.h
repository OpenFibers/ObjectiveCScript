//
//  OCSMessageSendArgList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 18/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSMessageSendArgList : NSObject <CPParseResult>

//Each object in ocsMessageSendArgs is an `OCSMessageSendArg` object.
@property (nonatomic, readonly) NSArray *ocsMessageSendArgs;

@end
