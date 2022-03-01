%{
#include <stdio.h>
#include <stdlib.h>
#include "global.h"
#include "mes_tokens.h"
struct Point mon_point;
%}
ENTIER [1-9][0-9]*
ESPACE [ \t]*
%start PREM_ENTIER SEC_ENTIER
%%
Point{ESPACE}"("{ESPACE}		BEGIN PREM_ENTIER;
<PREM_ENTIER>{ENTIER}			mon_point.x = atoi(yytext);
<PREM_ENTIER>{ESPACE}","{ESPACE}	BEGIN SEC_ENTIER;
<SEC_ENTIER>{ENTIER}		{ 
					mon_point.y = atoi(yytext);
					yylval.ppoint = (struct Point *) malloc (sizeof(struct Point));
					yylval.ppoint->x = mon_point.x;
					yylval.ppoint->y = mon_point.y;
					return POINT; 
				}
<SEC_ENTIER>{ESPACE}")"			BEGIN INITIAL;
Figure\{				return FIGURE;
Segment\{				return SEGMENT;
"}"					return ACCOLADE_FERMANTE;
{ESPACE}				/* ignorer */
\n					/* ignorer */
%%
