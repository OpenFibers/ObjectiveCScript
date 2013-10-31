//
//  OCSMultiClass.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 10/31/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSMultiClass.h"
#import "OCSClass.h"

@interface OCSMultiClass()

@property (nonatomic, retain) OCSClass *class;
@property (nonatomic, retain) OCSMultiClass *nextMultiClass;

@end

@implementation OCSMultiClass

- (id)initWithSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    self = [self init];
    
    if (nil != self)
    {
        OCSClass *class = [syntaxTree valueForTag:@"class"];
        OCSMultiClass *nextMultiClass = [syntaxTree valueForTag:@"multiclass"];
        
        if (class)
        {
            self.class = class;
        }
        
        if (nextMultiClass)
        {
            self.nextMultiClass = nextMultiClass;
        }
    }
    
    return self;
}

- (void)inject
{
    [self.class inject];
    [self.nextMultiClass inject];
}

@end
