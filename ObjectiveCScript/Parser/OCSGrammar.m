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

    //Public non-terminals
    
    //Protocols
    @"OCSProtocolList ::="//e.g. <UIWebViewDelegate, UIApplicationDelegate>
        @"'<' '>' |"                                  //Empty protocol list
        @"'<' identifierList@<OCSTypeList> '>';\n"    //Unempty protocol list
    @"OCSTypeList ::=" //e.g. UIWebViewDelegate, UIApplicationDelegate
        @"firstType@'Identifier' |"
        @"firstType@'Identifier' ',' nextTypeList@<OCSTypeList>;\n"
    
    //Identifier and declaration
    @"OCSIdentifier ::="//e.g. view | *view | **someInt
        @"identifier@'Identifier' |"
        @"'*' nextOCSIdentifier@<OCSIdentifier>;\n"
    @"OCSIdentifierList ::="//e.g. viewA, *viewB
        @"firstIdentifier@<OCSIdentifier> |"
        @"firstIdentifier@<OCSIdentifier> ',' nextIdentifierList@<OCSIdentifierList> ;\n"
    @"OCSIdentifierDeclaration ::="//e.g. UIView *_aView, *_bView;
        @"ocsType@'Identifier' ocsIdentifierList@<OCSIdentifierList> ';' ;\n"
    @"OCSIdentifierDeclarationList ::="//several OCSIdentifierDeclaration
        @"firstDeclaration@<OCSIdentifierDeclaration> |"
        @"firstDeclaration@<OCSIdentifierDeclaration> nextDeclarationList@<OCSIdentifierDeclarationList> ;\n"

    //Class
    @"OCSFile ::= multiclass@<OCSMultiClass>;\n"
    @"OCSMultiClass ::= class@<OCSClass> | class@<OCSClass> multiclass@<OCSMultiClass>;\n"
    @"OCSClass ::= classHeader@<OCSClassHeader>;\n"
    
    //Class header
    @"OCSClassHeader ::= classDeclaration@<OCSClassDeclaration> ocsIvarList@<OCSIvarList>;\n"
    @"OCSClassDeclaration ::="
        @"'@interface' className@'Identifier' |"
        @"'@interface' className@'Identifier' ':' superClassName@'Identifier' |"
        @"'@interface' className@'Identifier' protocolList@<OCSProtocolList> |"
        @"'@interface' className@'Identifier' ':' superClassName@'Identifier' protocolList@<OCSProtocolList>;\n"
    @"OCSIvarList ::="
        @"'{' '}' |"
        @"'{' declarationList@<OCSIdentifierDeclarationList> '}' ;\n";
    
    

//    @"Expression ::= term@<Term>   | expr@<Expression> op@<AddOp> term@<Term>;\n"
//    @"Term       ::= fact@<Factor> | fact@<Factor>     op@<MulOp> term@<Term>;\n"
//    @"Factor     ::= num@'Number'  | '(' expr@<Expression> ')';"
//    @"AddOp      ::= '+' | '-';\n"
//    @"MulOp      ::= '*' | '/';\n"
    ;
    
#ifdef OCS_DEBUG
    CPGrammar *g = nil;
#else
    static CPGrammar *g = nil;
#endif
    if (!g)
    {
        NSError *error;
        g = [CPGrammar grammarWithStart:@"OCSFile"
                         backusNaurForm:expressionGrammar
                                  error:&error];
        NSAssert(!error, error.localizedDescription);
    }
    return g;
}

@end
