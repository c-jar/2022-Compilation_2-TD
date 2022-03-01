%{
#include "global.h"
#include "mes_tokens.h"
#include <stdio.h>
%}
/*%union{
struct Point *pointeur_point;
}*/
%token FIGURE SEGMENT POINT ACCOLADE_FERMANTE
%start Input
%%
Input : FIGURE ListeSegments ACCOLADE_FERMANTE
	;
Un_Segment : SEGMENT POINT POINT ACCOLADE_FERMANTE
	{
		printf("Segment : P(%d,%d) P(%d, %d)\n", $2->x, $2->y, $3->x, $3->y);
		free($2);
		free($3);
	};
ListeSegments : Un_Segment
	| Un_Segment ListeSegments
;
/*ListeSegmentsContrainte : Un_Segment Un_Segment Un_Segment
			| Un_Segment Un_Segment Un_Segment Un_Segment ;
*/
%%
int yyerror(char *s){
	printf("%s",s);
}

int main() {
	yyparse();
}
