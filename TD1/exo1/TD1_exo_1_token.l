%{
#include <stdio.h>
%}
identifiant [a-zA-Z][a-zA-Z0-9]*
%start VALEUR
%%
<INITIAL>{identifiant} { printf("La variable: %s ", yytext); }
"==" { printf("a pour valeur");
BEGIN VALEUR;}
" " /* ignorer */
<VALEUR>{identifiant} { printf(" %s\n", yytext);
BEGIN INITIAL;
}
%%
