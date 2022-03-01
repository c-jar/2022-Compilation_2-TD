%{
	#include "stdio.h"
	int caractere[256];
	int digramme[256][256];
	int trigramme[256][256][256];
%}
lettre [A-Za-z]
%%
{lettre}{3}	{ 
			trigramme[yytext[0]][yytext[1]][yytext[2]] ++;
			//printf("trigramme:<%s>\n",yytext); 
			REJECT; }
{lettre}{2}	{ 
			digramme[yytext[0]][yytext[1]] ++;			
			// printf("digramme:<%s>\n",yytext); 
			REJECT; }
{lettre}	{ 
			caractere[*yytext] ++;
			// printf("caractere:<%s>\n",yytext); 
		}
.       // ignorer
\n	// ignorer
%%

int main(void) {
	int i,j,k;
	for(i=0; i< 256; i++){
		caractere[i] = 0;
		for(j=0; j < 256; j++){
			digramme[i][j] = 0;
			for(k=0; k< 256; k++)
				trigramme[i][j][k] = 0;
		}
	}
yylex();

printf("Caracteres :\n");
for(i=0; i< 256; i++)
	if (caractere[i] != 0)
		printf("%c = %d,\t",i,caractere[i]);
printf("\ndigramme :\n");
for(i=0; i< 256; i++)
	for(j=0; j < 256; j++)
		if (digramme[i][j] != 0)
			printf ("%c%c = %d,\t", i, j, digramme[i][j]);
printf("\ntrigramme :\n");
for(i=0; i< 256; i++)
	for(j=0; j < 256; j++)
		for(k=0; k< 256; k++)
			if (trigramme[i][j][k] != 0)
				printf ("%c%c%c = %d,\t", i, j, k, trigramme[i][j][k]);
printf("\n");
}
