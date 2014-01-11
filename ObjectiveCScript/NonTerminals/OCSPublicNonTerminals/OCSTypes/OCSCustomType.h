//
//  OCSCustomType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMetaType.h"

@interface OCSCustomType : NSObject <CPParseResult>

@property (nonatomic, readonly) NSString *ocsTypeString;
@property (nonatomic, readonly) OCSMetaType ocsMetaType;

@end
