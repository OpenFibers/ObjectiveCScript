//
//  OCSFile.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 11/1/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSFile.h"
#import "OCSMultiClass.h"

@interface OCSFile ()
@property (nonatomic, retain) OCSMultiClass *multiClass;
@end

@implementation OCSFile

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSMultiClass *multiClass = [syntaxTree valueForTag:@"multiclass"];
        if (multiClass)
        {
            self.multiClass = multiClass;
        }
    }
    
    return self;
}

@end
