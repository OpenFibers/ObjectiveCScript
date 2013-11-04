//
//  OCSTypeList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/2/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSTypeList : NSObject <CPParseResult>

@property (nonatomic, readonly) NSArray *typeList;//Each identifier is an `NSString`

@end
