//
//  OCSClassHeader.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/3/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSClassHeader : NSObject <CPParseResult, NSCoding>

@property (nonatomic, readonly) NSString *ocsClassName;
@property (nonatomic, readonly) NSString *ocsSuperClassName;

//Get what protocals class has implemented.
//Each protocol is a `NSString`.
@property (nonatomic, readonly) NSArray *ocsProtocolList;

//Member variables
//Each key of `ocsMemberVariables` is a `OCSIdentifier`'s identifier name.
//Each object of `ocsMemberVariables` is a `OCSIdentifier`
@property (nonatomic, readonly) NSDictionary *ocsMemberVariables;

@end
