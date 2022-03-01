%{
#include "pascal_syntaxique.h"
#include <stdio.h>
extern int yylineno;
%}
%token TYPE VAR DEBUT ENDP PROGRAM AFFECTATION FONCTION CHAINE VIRGULE OP PO PF DPTS PV ID
%start Input
/* Pour la recuperation de la ligne en cours (utilisation de la variable yylineno partagee) */
%locations
%%
Input : PROGRAM ID PV Declarations DEBUT ListeInstructions ENDP
	;
Declarations : VAR ListeDeclarations
	;
ListeDeclarations : ListeIdentifiants DPTS TYPE PV
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
	printf("Line : %d : %s\n", yylineno, s); 
}
int main() { 
	yyparse(); 
}
