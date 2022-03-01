%{
	#include <stdio.h>
%}
identifiant	[a-zA-Z][a-zA-Z0-9]*
%%
{identifiant} 	{ printf("La variable : %s ", yytext); }
"=="  	{ printf("a pour valeur"); }
{identifiant}	{ printf(" %s\n", yytext); }
%%
