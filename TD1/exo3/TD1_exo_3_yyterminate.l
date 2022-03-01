%{
#include <stdlib.h>
int nb_mots = 0;
int nb_lignes = 0;
int nb_caracteres = 0;
float moyenne = 0.0;
void afficher_stats();
%}
mot [[:alnum:]\-_]+
%start POUREOF
%%
{mot} {
nb_mots++;
nb_caracteres += yyleng;
printf ("[%d]",yyleng);
// ECHO;
BEGIN POUREOF;
}
\n { nb_lignes++;
BEGIN INITIAL;
}
<POUREOF><<EOF>> {
nb_lignes++;
afficher_stats();
yyterminate();
}
<<EOF>> {
afficher_stats();
yyterminate();
}
. /* ignorer */
%%
void afficher_stats()
{
if (nb_mots != 0)
moyenne = nb_caracteres/nb_mots;
printf("La moyenne de la taille des mots est %.2f\n", moyenne);
printf("Le nombre de ligne est %d et de mot %d\n", nb_lignes,nb_mots);
}
