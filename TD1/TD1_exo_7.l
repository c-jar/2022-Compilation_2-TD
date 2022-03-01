%{
	#include <stdio.h>
	void convertir(char *, int);
	float compte;
%}
VALEUR [0-9]+,[0-9]{2}
OPERATION ^[+\-]{VALEUR}
SEPARATEUR --+
%%
:{VALEUR} { 
		convertir(yytext, yyleng);
		compte = atof(&yytext[1]);
		printf("Solde initial : %f\n",compte);
}
{OPERATION} { 
		convertir(yytext, yyleng);
		compte += atof(yytext);
		ECHO;
}
{SEPARATEUR} { 
		ECHO;
		printf("\n= %.2f", compte);
}
%%
void convertir(char *chaine, int taille)
{
	int i = 0;
	for(i=0; i<taille;i++) {
		if (chaine[i] == ',') { 
			chaine[i] = '.';
			break; 
		}
	}
}
