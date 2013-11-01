//
//  OCSClassHeader.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSProtocolList.h"

@interface OCSClassHeader : NSObject <CPParseResult>

@property (nonatomic, retain) NSString *ocsClassName;
@property (nonatomic, retain) NSString *ocsSuperClassName;
@property (nonatomic, retain) OCSProtocolList *ocsProtocalList;//What protocals class has implemented

@end
