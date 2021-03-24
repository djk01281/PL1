%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INT
%token ADD
%token SUB
%token MUL
%token DIV
%token LPR
%token RPR
%token EOL
%%
program:
program addexpr EOL {printf("%d\n", $2);}
|
;
addexpr:
| addexpr ADD term {$$=$1+$3;}
| addexpr SUB term {$$=$1-$3;}
| mulexpr {$$=$1;}
;
mulexpr:
addexpr MUL term {$$=$1*$3;}
|addexpr DIV term {$$=$1/$3;}
| term {$$=$1;}
;
term:
INT {$$=$1;}
| LPR addexpr RPR {$$=$2;}
| INT {$$=$1;}
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(int argc, char *argv){
yyparse();
return 0;
}
