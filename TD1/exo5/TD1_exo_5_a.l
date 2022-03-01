%{
#include <stdio.h>
%}
identifiant [a-zA-Z][a-zA-Z0-9]*
%start CHAINE CHAINEVIDE BALISE AFFECTATION BALISEDEBUT PRECHAINE COMMENTAIRE
%%
<INITIAL>"<" { BEGIN BALISEDEBUT; }
<INITIAL>. /* ignorer */
<INITIAL>"<!--" { BEGIN COMMENTAIRE; }
<COMMENTAIRE>. /* ignorer */
<COMMENTAIRE>"-->" { BEGIN INITIAL; }
<BALISEDEBUT>{identifiant} { printf("Balise :<%s>\n",yytext); BEGIN BALISE;}
<BALISEDEBUT>. { printf("Erreur\n"); yyterminate();}
<BALISE>{identifiant} { printf("Attribut :<%s>\n",yytext); BEGIN AFFECTATION;}
<BALISE>" " /* ignorer */
<BALISE>">" { BEGIN INITIAL; }
<BALISE>. { printf("Erreur\n"); yyterminate();}
<AFFECTATION>= { BEGIN PRECHAINE; }
<AFFECTATION>" " /* ignorer */
<AFFECTATION>. { printf("Erreur\n"); yyterminate();}
<PRECHAINE>\" { BEGIN CHAINEVIDE;}
<PRECHAINE>" " /* ignorer */
<PRECHAINE>. { printf("Erreur\n"); yyterminate();}
<CHAINEVIDE>[^\"]* { printf("chaine:<%s>\n",yytext); BEGIN CHAINE;}
<CHAINEVIDE>\" { printf ("chaine vide\n"); BEGIN BALISE; }
<CHAINE>\" {BEGIN BALISE;}
%%
