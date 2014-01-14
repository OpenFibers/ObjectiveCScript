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
    
    //Type
    @"OCSVoidType ::="
        @"'void' ;\n"
    @"OCSBasicType ::="
        @"'BOOL' |"
        @"'bool' |"
        @"'int' |"
        @"'short' |"
        @"'long long' |"
        @"'long' |"
        @"'float' |"
        @"'double' |"
        @"'NSInteger' |"
        @"'NSUInteger' |"
        @"'CGFloat' |"
        @"'CGPoint' |"
        @"'CGSize' |"
        @"'CGRect' |"
        @"'NSRect' ;\n"
    @"OCSCustomType ::="
        @"customType@'Identifier' ;\n"
    @"OCSIDType ::="
        @"'id' ;\n"
    @"OCSType ::="
        @"ocsVoidType@<OCSVoidType> |"
        @"ocsBasicType@<OCSBasicType> |"
        @"ocsIDType@<OCSIDType> |"
        @"ocsCustomType@<OCSCustomType> ;\n"
    @"OCSPointerList ::="
        @"'*' |"
        @"'*' nextPointerList@<OCSPointerList>;\n"
    
    //OCSArgumentType is argument type, return type or casts
    //e.g. (void) (int) (int *) (id) (UIView *) (NSError **)
    @"OCSArgumentType ::="
        @"'(' ocsType@<OCSType> ')' |"
        @"'(' ocsType@<OCSType> ocsPointerList@<OCSPointerList> ')';\n"
    
    //Protocols
    @"OCSProtocolListWithBrackets ::="//e.g. <UIWebViewDelegate, UIApplicationDelegate>
        @"'<' '>' |"                                  //Empty protocol list
        @"'<' identifierList@<OCSProtocolList> '>';\n"    //Unempty protocol list
    @"OCSProtocolList ::=" //e.g. UIWebViewDelegate, UIApplicationDelegate
        @"firstType@'Identifier' |"
        @"firstType@'Identifier' ',' nextTypeList@<OCSProtocolList>;\n"
    
    //Identifier and declaration
    @"OCSIdentifier ::="//e.g. view | *view | **someInt
        @"identifier@'Identifier' |"
        @"ocsPointerList@<OCSPointerList> identifier@'Identifier';\n"
    @"OCSIdentifierList ::="//e.g. viewA, *viewB
        @"firstIdentifier@<OCSIdentifier> |"
        @"firstIdentifier@<OCSIdentifier> ',' nextIdentifierList@<OCSIdentifierList> ;\n"
    @"OCSIdentifierDeclaration ::="//e.g. UIView *_aView, *_bView;
        @"ocsType@<OCSType> ocsIdentifierList@<OCSIdentifierList> ';' ;\n"
    @"OCSIdentifierDeclarationList ::="//several OCSIdentifierDeclaration
        @"firstDeclaration@<OCSIdentifierDeclaration> |"
        @"firstDeclaration@<OCSIdentifierDeclaration> nextDeclarationList@<OCSIdentifierDeclarationList> ;\n"

    //Class
    @"OCSFile ::= multiclass@<OCSMultiClass>;\n"
    @"OCSMultiClass ::= class@<OCSClass> | class@<OCSClass> multiclass@<OCSMultiClass>;\n"
    @"OCSClass ::= "
        @"classHeader@<OCSClassHeader> |"
        @"classHeader@<OCSClassHeader> classBody@<OCSClassBody>;\n"
    
    //Class header
    @"OCSClassHeader ::= classDeclaration@<OCSClassDeclaration> ocsIvarList@<OCSIvarList>;\n"
    @"OCSClassDeclaration ::="
        @"'@interface' className@'Identifier' |"
        @"'@interface' className@'Identifier' ':' superClassName@'Identifier' |"
        @"'@interface' className@'Identifier' protocolList@<OCSProtocolListWithBrackets> |"
        @"'@interface' className@'Identifier' ':' superClassName@'Identifier' protocolList@<OCSProtocolListWithBrackets>;\n"
    @"OCSIvarList ::="
        @"'{' '}' |"
        @"'{' declarationList@<OCSIdentifierDeclarationList> '}' ;\n"
    
    //Class body
    @"OCSClassBody ::= methodList@<OCSMethodList>;\n"
    @"OCSMethodList ::="
        @"firstMethod@<OCSMethod> |"
        @"firstMethod@<OCSMethod> nextMethodList@<OCSMethodList>;\n"
    
    //Method
    @"OCSMethod ::="
        @"methodDeclaration@<OCSMethodDeclaration> methodBody@<OCSMethodBody>;\n"
    @"OCSMethodType ::="
        @"'+' |"
        @"'-' ;\n"
    @"OCSMethodDeclarationArg ::="
        @"ocsMethodName@'Identifier' ':' ocsArgType@<OCSArgumentType> ocsArgName@'Identifier';\n"
    @"OCSMethodDeclarationArgList ::="
        @"ocsDelarationArg@<OCSMethodDeclarationArg> |"
        @"ocsDelarationArg@<OCSMethodDeclarationArg> nextMethodDeclarationArgList@<OCSMethodDeclarationArgList> ;\n"
    @"OCSMethodDeclaration ::="
        @"ocsMethodType@<OCSMethodType> ocsMethodReturnType@<OCSArgumentType>"//method with args
        @"ocsMethodArgList@<OCSMethodDeclarationArgList> |"
        @"ocsMethodType@<OCSMethodType> ocsMethodReturnType@<OCSArgumentType>"//method with args
        @"ocsMethodNameWithoutArg@'Identifier';\n"
    @"OCSMethodBody ::= '{' '}';\n"
    ;

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
