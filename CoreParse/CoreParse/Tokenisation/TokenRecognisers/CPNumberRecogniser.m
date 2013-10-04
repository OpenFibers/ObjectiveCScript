//
//  CPIntegerRecogniser.m
//  CoreParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "CPNumberRecogniser.h"

#import "CPNumberToken.h"

@implementation CPNumberRecogniser

@synthesize recognisesInts;
@synthesize recognisesFloats;

#define CPNumberRecogniserRecognisesIntsKey @"N.i"
#define CPNumberRecogniserRecognisesFloatsKey @"N.f"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setRecognisesInts:[aDecoder decodeBoolForKey:CPNumberRecogniserRecognisesIntsKey]];
        [self setRecognisesFloats:[aDecoder decodeBoolForKey:CPNumberRecogniserRecognisesFloatsKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:[self recognisesInts] forKey:CPNumberRecogniserRecognisesIntsKey];
    [aCoder encodeBool:[self recognisesFloats] forKey:CPNumberRecogniserRecognisesFloatsKey];
}

+ (id)integerRecogniser
{
    CPNumberRecogniser *rec = [[[CPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:YES];
    [rec setRecognisesFloats:NO];
    return rec;
}

+ (id)floatRecogniser
{
    CPNumberRecogniser *rec = [[[CPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:NO];
    [rec setRecognisesFloats:YES];
    return rec;
}

+ (id)numberRecogniser
{
    CPNumberRecogniser *rec = [[[CPNumberRecogniser alloc] init] autorelease];
    [rec setRecognisesInts:YES];
    [rec setRecognisesFloats:YES];
    return rec;
}

- (CPNumberRecogniserSuffix)recogniseNumberSuffix:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSScanner *scanner = [NSScanner scannerWithString:tokenString];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];
    
    CPNumberRecogniserSuffix suffix = 0;
    
    if  ([scanner scanString:@"llu" intoString:nil] || [scanner scanString:@"LLU" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixLongLong | CPNumberRecogniserSuffixUnsigned;
    }
    else if([scanner scanString:@"ll" intoString:nil] || [scanner scanString:@"LL" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixLongLong;
    }
    else if ([scanner scanString:@"l" intoString:nil] || [scanner scanString:@"L" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixLong;        
    }
    else if ([scanner scanString:@"ull" intoString:nil] || [scanner scanString:@"ULL" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixLongLong | CPNumberRecogniserSuffixUnsigned;
    }
    else if ([scanner scanString:@"ul" intoString:nil] || [scanner scanString:@"UL" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixLong | CPNumberRecogniserSuffixUnsigned;
    }
    else if ([scanner scanString:@"u" intoString:nil] || [scanner scanString:@"U" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixUnsigned;
    }
    else if ([scanner scanString:@"f" intoString:nil] || [scanner scanString:@"F" intoString:nil])
    {
        suffix = CPNumberRecogniserSuffixFloat;
    }
    return suffix;
}

- (CPToken *)recogniseTokenInString:(NSString *)tokenString currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSScanner *scanner = [NSScanner scannerWithString:tokenString];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];
    
    CPNumberToken *returnToken = nil;

    if (self.recognisesFloats)//If should recognise float
    {
        double d;
        BOOL success = [scanner scanHexDouble:&d];
        if (!success)
        {
            success = [scanner scanDouble:&d];
        }
        if (success && ![self recognisesInts])//If recognise float only
        {
            NSRange numberRange = NSMakeRange(*tokenPosition, [scanner scanLocation] - *tokenPosition);
            if ([tokenString rangeOfString:@"." options:0x0 range:numberRange].location == NSNotFound &&
                [tokenString rangeOfString:@"e" options:0x0 range:numberRange].location == NSNotFound)
            {
                success = NO;
            }
        }
        if (success)
        {
            *tokenPosition = [scanner scanLocation];
            returnToken = [CPNumberToken tokenWithNumber:[NSNumber numberWithDouble:d]];
        }
    }
    else//If should recognise int only
    {
        NSInteger i;
        BOOL success = [scanner scanInteger:&i];
        if (success)
        {
            *tokenPosition = [scanner scanLocation];
            returnToken = [CPNumberToken tokenWithNumber:[NSNumber numberWithInteger:i]];
        }
    }
    
    return returnToken;
}

@end
