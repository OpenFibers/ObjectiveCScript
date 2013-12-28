//
//  OCSClassBody.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 28/12/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSClassBody : NSObject <CPParseResult, NSCoding>

//keys in `declaredMethods` is method name string
//values in `declaredMethods` is `OCSMethod` object
@property (nonatomic, readonly) NSDictionary *ocsDeclaredMethods;

@end
