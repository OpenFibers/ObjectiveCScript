//
//  OCSIdentifierDeclaration.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. UIView *_aView, *_bView;

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSIdentifierDeclaration : NSObject <CPParseResult>

//Each object of `ocsIdentifierArray` is an `OCSIdentifier`
@property (nonatomic, readonly) NSArray *ocsIdentifierArray;

@end
