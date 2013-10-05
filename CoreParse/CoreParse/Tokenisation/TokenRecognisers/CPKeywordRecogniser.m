//
//  CPKeywordRecogniser.m
//  CoreParse
//
//  Created by Tom Davie on 12/02/2011.
//  Copyright 2011 In The Beginning... All rights reserved.
//

#import "CPKeywordRecogniser.h"

@implementation CPKeywordRecogniser

@synthesize keywords = _keywords;
@synthesize invalidFollowingCharacters = _invalidFollowingCharacters;

+ (id)recogniserForKeyword:(NSString *)keyword
{
    return [self recogniserForKeywords:[NSArray arrayWithObject:keyword]];
}

+ (id)recogniserForKeywords:(NSArray *)keywords
{
    return [[[self alloc] initWithKeywords:keywords] autorelease];
}

- (id)initWithKeyword:(NSString *)initKeyword
{
    return [self initWithKeywords:[NSArray arrayWithObject:initKeyword]];
}

- (id)initWithKeywords:(NSArray *)keywords
{
    return [self initWithKeywords:keywords invalidFollowingCharacters:nil];
}

+ (id)recogniserForKeyword:(NSString *)keyword invalidFollowingCharacters:(NSCharacterSet *)invalidFollowingCharacters
{
    return [self recogniserForKeywords:[NSArray arrayWithObject:keyword]
            invalidFollowingCharacters:invalidFollowingCharacters];
}

+ (id)recogniserForKeywords:(NSArray *)keywords invalidFollowingCharacters:(NSCharacterSet *)invalidFollowingCharacters
{
    return [[[self alloc] initWithKeywords:keywords invalidFollowingCharacters:invalidFollowingCharacters] autorelease];
}

- (id)initWithKeyword:(NSString *)keyword invalidFollowingCharacters:(NSCharacterSet *)initInvalidFollowingCharacters
{
    return [self initWithKeywords:[NSArray arrayWithObject:keyword] invalidFollowingCharacters:initInvalidFollowingCharacters];
}

- (id)initWithKeywords:(NSArray *)keywords invalidFollowingCharacters:(NSCharacterSet *)invalidFollowingCharacters
{
    self = [super init];
    
    if (nil != self)
    {
        self.keywords = keywords;
        [self setInvalidFollowingCharacters:invalidFollowingCharacters];
    }
    
    return self;
}

- (id)init
{
    return [self initWithKeyword:@" "];
}

#define CPKeywordRecogniserKeywordKey @"K.k"
#define CPKeywordRecogniserInvalidFollowingCharactersKey @"K.f"

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (nil != self)
    {
        [self setKeywords:[aDecoder decodeObjectForKey:CPKeywordRecogniserKeywordKey]];
        [self setInvalidFollowingCharacters:[aDecoder decodeObjectForKey:CPKeywordRecogniserInvalidFollowingCharactersKey]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self keywords] forKey:CPKeywordRecogniserKeywordKey];
    [aCoder encodeObject:[self invalidFollowingCharacters] forKey:CPKeywordRecogniserInvalidFollowingCharactersKey];
}

- (void)dealloc
{
   [_keywords release];
   [_invalidFollowingCharacters release];
    
    [super dealloc];
}

- (CPToken *)recogniseTokenWithScanner:(NSScanner *)scanner currentTokenPosition:(NSUInteger *)tokenPosition
{
    for (NSString *keyword in self.keywords)
    {
        NSUInteger kwLength = [keyword length];
        NSUInteger remainingChars = [[scanner string] length] - *tokenPosition;
        if (remainingChars >= kwLength)
        {
            if (CFStringFindWithOptions((CFStringRef)[scanner string], (CFStringRef)keyword, CFRangeMake(*tokenPosition, kwLength), kCFCompareAnchored, NULL))
            {
                if (remainingChars == kwLength ||
                    nil == self.invalidFollowingCharacters ||
                    !CFStringFindCharacterFromSet((CFStringRef)[scanner string], (CFCharacterSetRef)self.invalidFollowingCharacters, CFRangeMake(*tokenPosition + kwLength, 1), kCFCompareAnchored, NULL))
                {
                    *tokenPosition = *tokenPosition + kwLength;
                    return [CPKeywordToken tokenWithKeyword:keyword];
                }
            }
        }
    }
    
    return nil;
}

@end
