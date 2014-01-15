//
//  OCSMethodDeclarationArgList.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 15/1/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSMethodDeclarationArgList : NSObject <CPParseResult>

//Each member of `ocsMethodArgs` is an `OCSMethodDeclarationArg` object.
@property (nonatomic, readonly) NSArray *ocsMethodArgs;

@end
