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

@property (nonatomic, retain) NSString *ocsClassName;
@property (nonatomic, retain) NSString *ocsSuperClassName;

//Get what protocals class has implemented.
//Each protocol is a `NSString`.
@property (nonatomic, retain) NSArray *ocsProtocolList;

@end