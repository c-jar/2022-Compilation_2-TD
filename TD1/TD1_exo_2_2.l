%{
#include <stdlib.h>
int nb_mots = 0;
int nb_lignes = 0;
int nb_caracteres = 0;
float moyenne = 0.0;

%}

%%
<INITIAL>" " nb_mots++;
<INITIAL>[\d\w] nb_caracteres++;
<INITIAL>\n nb_lignes++; 
%%
void main()
{
	yylex();
	if (nb_mots != 0)
		moyenne = nb_caracteres/nb_mots;
	printf("La moyenne de la taille des mots est %.2f\n", moyenne);
	printf("Le nombre de ligne est %d et de mot %d\n", nb_lignes,nb_mots);
}
