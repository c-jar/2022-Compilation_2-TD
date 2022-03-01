%{
#include <stdio.h>
int compteur = 0;
%}
entier ([1-9][0-9]*)|0
nonentier 0[0-9]+
%start IGNORER
%%
<INITIAL>{entier} { int mon_entier = atoi(yytext);
if ((mon_entier % 2) == 0)
{ compteur++;
printf("<%d>",mon_entier);
}
if (compteur == 10) //exit(0);
BEGIN IGNORER;
}
<INITIAL>{nonentier} /* ignorer */
<IGNORER>.* /* ignorer */
%%
