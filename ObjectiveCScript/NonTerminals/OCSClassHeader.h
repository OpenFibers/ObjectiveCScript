//
//  OCSClassHeader.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSClassHeader : NSObject <CPParseResult, NSCoding>

@property (nonatomic, retain) NSString *ocsClassName;
@property (nonatomic, retain) NSString *ocsSuperClassName;

@end
