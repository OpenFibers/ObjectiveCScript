//
//  OCSType.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/7/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

#import "OCSMetaType.h"

@interface OCSType : NSObject <CPParseResult>

@property (nonatomic, readonly) NSString *ocsTypeString;
@property (nonatomic, readonly) OCSIdentifierMetaType ocsMetaType;

@end
