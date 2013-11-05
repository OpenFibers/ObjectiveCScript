//
//  OCSIdentifier.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. view | *view | **someInt

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

typedef enum {
    OCSIdentifierMetaTypeCustom,//Custom object type. Pointer count only can be 1.
    OCSIdentifierMetaTypeC,//C type: int, unsign int, CGRect, etc. Pointer count can be any value.
    OCSIdentifierMetaTypeId//id. Pointer count only can be 0.
} OCSIdentifierMetaType;

@interface OCSIdentifier : NSObject <CPParseResult, NSCoding>

//the * count before identifier
//e.g. if syntax tree is ***view, then `pointerCount` is 3
@property (nonatomic, readonly) NSUInteger pointerCount;

@property (nonatomic, readonly) NSString *ocsIdentifierName;

@property (nonatomic, retain) NSString *typeString;//Type string

@property (nonatomic, assign) OCSIdentifierMetaType metaType;//Meta type of type

@end
