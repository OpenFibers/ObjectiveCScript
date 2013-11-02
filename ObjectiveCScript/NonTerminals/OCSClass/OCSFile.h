//
//  OCSFile.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSFile : NSObject <CPParseResult, NSCoding>

- (void)inject;
- (NSData *)archivedData;

@end
