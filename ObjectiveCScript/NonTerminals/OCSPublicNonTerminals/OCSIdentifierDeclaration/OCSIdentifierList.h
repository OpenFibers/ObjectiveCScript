//
//  OCSIdentifierList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. viewA, *viewB

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSIdentifierList : NSObject <CPParseResult>

//Each object in `ocsIdentifiers` is an `OCSIdentifier` object.
@property (nonatomic, readonly) NSArray *ocsIdentifiers;

@end
