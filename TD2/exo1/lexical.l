%{
	#include "syntaxique.h"
	#include <malloc.h>
	#include <string.h>
%}
NUMERO [0-9]{10}
ADRESSE [a-z0-9]+@[a-z0-9\.]+\.[a-z]{2,}
%start CARACTERES
%%
[Pp]ersonne return PERSONNE;
[Cc]ontact return CONTACT;
"}" return ACCOLADE_FERMANTE;
"{" return ACCOLADE_OUVRANTE;
numero_tel return NUMTEL;
email return EMAIL;
<INITIAL>\" BEGIN CARACTERES;
<CARACTERES>{NUMERO} {
	yylval.chaine = (char *) malloc(sizeof(char)*yyleng+1);
	strncpy(yylval.chaine,yytext,yyleng+1);
	return CHAINE;
}
<CARACTERES>{ADRESSE} {
	yylval.chaine = (char *) malloc(sizeof(char)*yyleng+1);
	strncpy(yylval.chaine,yytext,yyleng+1);
	return CHAINE;
}
<CARACTERES>\" BEGIN INITIAL;
. /* vide */
\n /* vide */
%%
