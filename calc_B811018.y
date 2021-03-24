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
program expr EOL {printf("%d\n", $2);}
|
;
expr:
expr ADD smexpr {
    $$=$1+$3; 
    printf("%d + %d = %d\n", $1, $3, $1 + $3);
    }
| expr SUB smexpr {
    $$=$1-$3; 
    printf("%d - %d = %d\n", $1, $3, $1 - $3);
    }
| smexpr {$$=$1;}
;
smexpr:
smexpr MUL term {
    $$=$1*$3; 
    printf("%d * %d = %d\n", $1, $3, $1 * $3);
    }
| smexpr DIV term {
    $$=$1/$3; 
    printf("%d / %d = %d\n", $1, $3, $1 / $3);
    }
| term {$$=$1;}
;
term:
LPR expr RPR {$$=$2;}
| INT {$$=$1;}
;
%%
void yyerror(char *s) {
printf(stderr, "%s\n", s);
}
int main(int argc, char *argv){

yyparse();
return 0;
}
