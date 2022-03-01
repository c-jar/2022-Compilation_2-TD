%{
#include <stdlib.h>
int nb_sauts = 0;
%}
mot [[:alnum:]\-_]+
%%
{mot} {
if (nb_sauts == 0)
{
ECHO; // affiche yytext
printf(" ");
nb_sauts = yyleng - 1;
}
else
nb_sauts--;
}
. /* ignorer */
%%
