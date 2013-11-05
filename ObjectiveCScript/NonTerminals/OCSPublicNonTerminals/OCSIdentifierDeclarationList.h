//
//  OCSIdentifierDeclarationList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/5/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  several OCSIdentifierDeclaration

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSIdentifierDeclarationList : NSObject <CPParseResult>

//keys in `declaredIdentifiers` is identifier string
//values in `declaredIdentifiers` is `OCSIdentifier` object
@property (nonatomic, readonly) NSDictionary *declaredIdentifiers;

@end
