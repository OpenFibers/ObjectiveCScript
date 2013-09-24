//
//  OCSTokeniser.h
//  ObjectiveCScriptDemo
//
//  Created by openthread on 9/24/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreParse/CoreParse.h>

@interface OCSTokeniser : NSObject

/**
 * Tokenises an input string by repeatedly using the recognisers in the tokeniser's priority list.
 *
 * If the entire input is tokenised a CPEOFToken is added to the end of the result token stream.  If not, the token stream ends with no EOF token.
 *
 * @param input The input string to tokenise.
 * @return Returns a token stream containing all tokens found in the input string.
 */
+ (CPTokenStream *)tokenise:(NSString *)input;

/**
 * Tokenises an input string into a pre-allocated output CPTokenStream.
 *
 * If the entire input is tokenised a CPEOFToken is added to the end of the result token stream.  If not, the token stream ends with no EOF token.
 * This method can be useful for multithreading parsers, allowing you to create the token stream that the tokeniser writes to and pass it to both tokeniser and parser threads.
 *
 * @param input The input string to tokenise.
 * @param tokenStream The token stream to add tokens to from the input string.
 */
+ (void)tokenise:(NSString *)input into:(CPTokenStream *)tokenStream;

@end
