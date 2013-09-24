//
//  OCSParser.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 9/24/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSParser.h"
#import "OCSGrammar.h"
#import "OCSConstant.h"

@interface OCSParser ()<CPParserDelegate>
@end

@implementation OCSParser

- (id)parser:(CPParser *)parser didProduceSyntaxTree:(CPSyntaxTree *)syntaxTree
{
    NSLog(@"ParserDelegate:didProduceSyntaxTree: %@", syntaxTree);
    
    return [(CPKeywordToken *)[syntaxTree childAtIndex:0] keyword];
}

- (CPRecoveryAction *)parser:(CPParser *)parser didEncounterErrorOnInput:(CPTokenStream *)inputStream expecting:(NSSet *)acceptableTokens
{
    NSLog(@"Error");
    return [CPRecoveryAction recoveryActionStop];
}

+ (id)sharedInstance
{
    static OCSParser *parser = nil;
    if (!parser)
    {
        parser = [[OCSParser alloc] init];
    }
    return parser;
}

+ (CPParser *)parser
{
#ifdef OCS_DEBUG //Generate parse in 
    CPGrammar *grammar = [OCSGrammar objectiveCGrammar];
    CPParser *parser = nil;
    if (grammar)
    {
        parser = [CPLALR1Parser parserWithGrammar:grammar];
        parser.delegate = [OCSParser sharedInstance];
    }
    return parser;
#else
    static CPParser *parser = nil;
    if (!parser)
    {
        CPGrammar *grammar = [OCSGrammar objectiveCGrammar];
        if (grammar)
        {
            parser = [CPLALR1Parser parserWithGrammar:grammar];
            parser.delegate = [OCSParser sharedInstance];
        }
    }
    return parser;
#endif
}

@end
