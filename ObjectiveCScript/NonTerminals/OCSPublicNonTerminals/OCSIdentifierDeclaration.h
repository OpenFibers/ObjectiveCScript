//
//  OCSIdentifierDeclaration.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. UIView *_aView, *_bView;
//  If two declaration has the same name, the first one will be covered by the last one.

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSIdentifierDeclaration : NSObject <CPParseResult>

//keys in `declaredIdentifiers` is identifier string
//values in `declaredIdentifiers` is `OCSIdentifier` object
@property (nonatomic, readonly) NSDictionary *ocsDeclaredIdentifiers;

@end
