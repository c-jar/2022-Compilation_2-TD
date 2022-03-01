%{
#include <stdio.h>
#include <stdlib.h>
#include "pascal_syntaxique.h"
%}
ESPACE [ \t]*
/* Definition de la variable partagee pour le numero de ligne */
%option yylineno
%%
INTEGER		return TYPE;
VAR		return VAR;
BEGIN		return DEBUT;
END\.		return ENDP;
PROGRAM		return PROGRAM;
":="		return AFFECTATION;
(Read|ReadLn)	return FONCTION;
(Write|WriteLn) return FONCTION;
\'.*\'		return CHAINE;
,		return VIRGULE;
"+"		return OP;
\(		return PO;
\)		return PF;
":"		return DPTS;
[A-Za-z][A-Za-z0-9]+ return ID;
";"		return PV;
\{.*\}		/* ignorer */
{ESPACE}	/* ignorer */
\n		/* ignorer */
%%
