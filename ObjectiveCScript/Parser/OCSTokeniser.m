//
//  OCSTokeniser.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 9/24/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSTokeniser.h"
#import "OCSConstant.h"

@interface OCSTokeniser ()<CPTokeniserDelegate>

@property (nonatomic, readonly) CPTokeniser *tokeniser;

@end

@implementation OCSTokeniser
{
    CPTokeniser *_tokeniser;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _tokeniser = [[CPTokeniser alloc] init];

        [_tokeniser addTokenRecogniser:[CPNumberRecogniser numberRecogniser]];
        [_tokeniser addTokenRecogniser:[CPWhiteSpaceRecogniser whiteSpaceRecogniser]];
        [_tokeniser addTokenRecogniser:[CPQuotedRecogniser quotedRecogniserWithStartQuote:@"/*"
                                                                                 endQuote:@"*/"
                                                                                     name:@"Comment"]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@"+"]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@"-"]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@"*"]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@"/"]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@"("]];
        [_tokeniser addTokenRecogniser:[CPKeywordRecogniser recogniserForKeyword:@")"]];
        
        _tokeniser.delegate = self;
    }
    return self;
}

- (BOOL)tokeniser:(CPTokeniser *)tokeniser shouldConsumeToken:(CPToken *)token
{
    return YES;
}

- (NSArray *)tokeniser:(CPTokeniser *)tokeniser willProduceToken:(CPToken *)token
{
    if ([token isKindOfClass:[CPWhiteSpaceToken class]] || [[token name] isEqualToString:@"Comment"])
    {
        return [NSArray array];
    }
    return [NSArray arrayWithObject:token];
}

- (CPTokeniser *)tokeniser
{
    return _tokeniser;
}

+ (OCSTokeniser *)sharedInstance
{
#ifdef OCS_DEBUG
    OCSTokeniser *instance = [[OCSTokeniser alloc] init];
#else
    static OCSTokeniser *instance = nil;
    if (!instance)
    {
        instance = [[OCSTokeniser alloc] init];
    }
#endif
    return instance;
}

+ (CPTokenStream *)tokenise:(NSString *)input
{
    CPTokeniser *tokeniser = [[OCSTokeniser sharedInstance] tokeniser];
    CPTokenStream *steam = [tokeniser tokenise:input];
    return steam;
}

+ (void)tokenise:(NSString *)input into:(CPTokenStream *)tokenStream
{
    CPTokeniser *tokeniser = [[OCSTokeniser sharedInstance] tokeniser];
    [tokeniser tokenise:input into:tokenStream];
}

@end
