//
//  OCSClassHeader.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSClassDeclaration : NSObject <CPParseResult, NSCoding>

@property (nonatomic, readonly) NSString *ocsClassName;
@property (nonatomic, readonly) NSString *ocsSuperClassName;

//Get what protocals class has implemented.
//Each protocol is a `NSString`.
@property (nonatomic, readonly) NSArray *ocsProtocolList;

@end
