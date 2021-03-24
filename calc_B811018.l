%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}
%%
[0-9]+ { yylval=atoi(yytext); return INT; }
"("    {return LPR;}
")"    {return RPR;}
"+"	   {return ADD;}
"-"	   {return SUB;}
"/"	   {return DIV;}
"*"	   {return MUL;}
"exit" {return EXIT;}
\n     { return EOL;}
[ \t] ; /* skip whitespace */
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}