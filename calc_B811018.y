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
program expr EOL {printf("%d\n", $1);}
|
;
expr:
smexpr {$$=$1;}
expr ADD smexpr {
    $$=$1+$3; 
    }
| expr SUB smexpr {
    $$=$1-$3; 
    }
| expr MUL smexpr {
    $$=$1*$3; 
    }
| expr DIV smexpr {
    $$=$1/$3; 
    }
;
smexpr:
LPR expr RPR {$$=$2;}
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
