//
//  OCSGrammar.m
//  ObjectiveCScriptDemo
//
//  Created by openthread on 9/24/13.
//  Copyright (c) 2013 openthread. All rights reserved.
//

#import "OCSGrammar.h"
#import "OCSConstant.h"

@implementation OCSGrammar

+ (CPGrammar *)objectiveCGrammar
{
    NSString *expressionGrammar =
    @"Expression ::= term@<Term>   | expr@<Expression> op@<AddOp> term@<Term>;\n"
    @"Term       ::= fact@<Factor> | fact@<Factor>     op@<MulOp> term@<Term>;\n"
    @"Factor     ::= num@'Number'  | '(' expr@<Expression> ')';"
    @"AddOp      ::= '+' | '-';\n"
    @"MulOp      ::= '*' | '/';\n";
    
#ifdef OCS_DEBUG
    NSError *err = nil;
    CPGrammar *g = [CPGrammar grammarWithStart:@"Expression"
                                backusNaurForm:expressionGrammar
                                         error:&err];
#else
    static CPGrammar *g = nil;
    if (!g)
    {
        NSError *err = nil;
        g = [CPGrammar grammarWithStart:@"Expression"
                         backusNaurForm:expressionGrammar
                                  error:&err];
    }
#endif
    return g;
}

@end
