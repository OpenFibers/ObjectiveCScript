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

- (CPNumberRecogniserSuffix)recogniseNumberSuffixWithScanner:(NSScanner *)scanner
                                        currentTokenPosition:(NSUInteger *)tokenPosition  
{
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];
    
    CPNumberRecogniserSuffix suffix = 0;
    
    if ([scanner scanString:@"u" intoString:nil] || [scanner scanString:@"U" intoString:nil])
    {
        suffix = suffix | CPNumberRecogniserSuffixUnsigned;
    }
    if ([scanner scanString:@"ll" intoString:nil] || [scanner scanString:@"LL" intoString:nil])
    {
        suffix = suffix | CPNumberRecogniserSuffixLongLong;
    }
    if ([scanner scanString:@"l" intoString:nil] || [scanner scanString:@"L" intoString:nil])
    {
        suffix = suffix | CPNumberRecogniserSuffixLong;
    }
    if (!(suffix & CPNumberRecogniserSuffixUnsigned) && //Has not find unsigned suffix
        ([scanner scanString:@"u" intoString:nil] || [scanner scanString:@"U" intoString:nil]))
    {
        suffix = suffix | CPNumberRecogniserSuffixUnsigned;
    }
    if (suffix == 0 && //Has not find any suffix, then find f
        ([scanner scanString:@"f" intoString:nil] || [scanner scanString:@"F" intoString:nil]))
    {
        suffix = CPNumberRecogniserSuffixFloat;
    }
    *tokenPosition = [scanner scanLocation];
    return suffix;
}

- (NSNumber *)numberWithSuffix:(CPNumberRecogniserSuffix)suffix doubleValue:(double)d
{
    if (suffix & CPNumberRecogniserSuffixFloat)
    {
        return [NSNumber numberWithDouble:d];
    }
    else if (suffix & CPNumberRecogniserSuffixLongLong && suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedLongLong:round(d)];
    }
    else if (suffix & CPNumberRecogniserSuffixLongLong)
    {
        return [NSNumber numberWithLongLong:round(d)];
    }
    else if (suffix & CPNumberRecogniserSuffixLong && suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedLong:round(d)];
    }
    else if (suffix & CPNumberRecogniserSuffixLong)
    {
        return [NSNumber numberWithLong:round(d)];
    }
    else if (suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedInt:round(d)];
    }
    else
    {
        return [NSNumber numberWithDouble:d];
    }
    return nil;
}

- (NSNumber *)numberWithSuffix:(CPNumberRecogniserSuffix)suffix intValue:(int)i
{
    if (suffix & CPNumberRecogniserSuffixFloat)
    {
        return [NSNumber numberWithDouble:i];
    }
    else if (suffix & CPNumberRecogniserSuffixLongLong && suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedLongLong:i];
    }
    else if (suffix & CPNumberRecogniserSuffixLongLong)
    {
        return [NSNumber numberWithLongLong:i];
    }
    else if (suffix & CPNumberRecogniserSuffixLong && suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedLong:i];
    }
    else if (suffix & CPNumberRecogniserSuffixLong)
    {
        return [NSNumber numberWithLong:i];
    }
    else if (suffix & CPNumberRecogniserSuffixUnsigned)
    {
        return [NSNumber numberWithUnsignedInt:i];
    }
    else
    {
        return [NSNumber numberWithInt:i];
    }
    return nil;
}

- (CPToken *)recogniseTokenWithScanner:(NSScanner *)scanner currentTokenPosition:(NSUInteger *)tokenPosition
{
    NSString *tokenString = [scanner string];
    [scanner setCharactersToBeSkipped:nil];
    [scanner setScanLocation:*tokenPosition];
    
    NSNumber *returnNumber = nil;

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
            CPNumberRecogniserSuffix suffix = [self recogniseNumberSuffixWithScanner:scanner
                                                                currentTokenPosition:tokenPosition];
            returnNumber = [self numberWithSuffix:suffix doubleValue:d];
        }
    }
    else//If should recognise int only
    {
        NSInteger i;
        BOOL success = [scanner scanInteger:&i];
        if (success)
        {
            *tokenPosition = [scanner scanLocation];
            CPNumberRecogniserSuffix suffix = [self recogniseNumberSuffixWithScanner:scanner
                                                                currentTokenPosition:tokenPosition];
            returnNumber = [self numberWithSuffix:suffix intValue:i];
        }
    }
    
    CPNumberToken *returnToken = nil;
    if (returnNumber)
    {
        returnToken = [CPNumberToken tokenWithNumber:returnNumber];
    }
    
    return returnToken;
}

@end
