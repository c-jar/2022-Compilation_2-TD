%{
#include "syntaxique.h"
#include <stdio.h>
%}
%union {
 char *chaine;
}
%token <chaine> PERSONNE CONTACT ACCOLADE_FERMANTE ACCOLADE_OUVRANTE NUMTEL EMAIL CHAINE
%type <chaine> Contact
%start Input
%%
Input : PERSONNE ACCOLADE_OUVRANTE Contact ACCOLADE_FERMANTE
;
Contact : /* Vide */ 
	| Contact CONTACT ACCOLADE_OUVRANTE NUMTEL CHAINE ACCOLADE_FERMANTE {
		printf("Numero de tel : %s\n", $5);
		free($5);
	}
	| Contact CONTACT ACCOLADE_OUVRANTE EMAIL CHAINE ACCOLADE_FERMANTE {
		printf("Adresse electronique : %s\n", $5);
		free($5);
	}
	;
%%
int yyerror(char *s)
{
	printf("%s",s);
}
int main()
{
yyparse();
}
