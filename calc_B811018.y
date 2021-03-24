%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER
%%
program:
program expr '\n' {printf("%d\n", $2);}
|
;
addexpr:
INTEGER {$$=$1;}
| addexpr '+' term {$$=$1+$3;}
| addexpr '-' term {$$=$1-$3;}
| mulexpr {$$=$1;}
;
mulexpr:
expr '*' term {$$=$1*$3;}
| expr '/' term {$$=$1/$3;}
| term {$$=$1;}
;
term:
INTEGER {$$=$1;}
| '('expr')' {$$=$2;}
| INTEGER {$$=$1;}
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(int argc, char *argv){
yyparse();
return 0;
}