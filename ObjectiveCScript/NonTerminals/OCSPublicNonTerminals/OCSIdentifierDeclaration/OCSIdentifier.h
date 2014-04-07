//
//  OCSIdentifier.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/4/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//  e.g. view | *view | **someInt

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>
#import "OCSMetaType.h"

@interface OCSIdentifier : NSObject <CPParseResult, NSCoding>

- (id)initWithIdentifierName:(NSString *)identifierName
                pointerCount:(NSUInteger)pointerCount
                  typeString:(NSString *)typeString
                    metaType:(OCSMetaType)metaType;

//the * count before identifier
//e.g. if syntax tree is ***view, then `pointerCount` is 3
@property (nonatomic, readonly) long ocsPointerCount;

@property (nonatomic, readonly) NSString *ocsIdentifierName;

@property (nonatomic, retain) NSString *ocsTypeString;//Type string

@property (nonatomic, assign) OCSMetaType ocsMetaType;//Meta type of type

@end
