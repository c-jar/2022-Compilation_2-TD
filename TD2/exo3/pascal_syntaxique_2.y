%{
#include "pascal_syntaxique_2.h"
#include <stdio.h>
%}
%union {
	int line;
}
%token <line> TYPE VAR DEBUT ENDP PROGRAM AFFECTATION FONCTION CHAINE VIRGULE OP PO PF DPTS PV ID
%start Input
%%
Input : PROGRAM ID PV Declarations DEBUT ListeInstructions ENDP
	;
Declarations : VAR ListeDeclarations
	;
ListeDeclarations : error PV 
 	| ListeIdentifiants DPTS TYPE PV
	| ListeIdentifiants DPTS TYPE PV ListeDeclarations
	;
ListeIdentifiants : ID
	| ID VIRGULE ListeIdentifiants
	;
ListeInstructions : Instruction
	| Instruction ListeInstructions
	;
Instruction : error PV
	| ID AFFECTATION Expression PV { printf("Instruction Affectation reconnue\n"); }
	| FONCTION PO ListeArguments PF PV { printf("Instruction Fonction reconnue\n"); }
	;
ListeArguments : Argument
	| Argument VIRGULE ListeArguments
	;
Argument : ID
	| CHAINE
	;
Expression : ID
	| Expression OP Expression
	;
%%
int yyerror(const char *s) { 
	printf("Line number: %d : %s\n", yylval.line, s); 
}
int main() { 
	yylval.line = 1;
	yyparse(); 
}
