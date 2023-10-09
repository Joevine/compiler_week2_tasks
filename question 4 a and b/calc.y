%{
#include <stdio.h>
#include <math.h>
%}

%token NUMBER

%%

input: /* empty */
    | input line
    ;

line: '\n'
    | exp '\n'   { printf("Result: %lf\n", $1); }
    ;

exp: NUMBER        { $$ = $1; }
   | exp '+' exp   { $$ = $1 + $3; }
   | exp '-' exp   { $$ = $1 - $3; }
   | exp '*' exp   { $$ = $1 * $3; }
   | exp '/' exp   { 
                      if ($3 == 0) {
                          fprintf(stderr, "Error: Division by zero.\n");
                          exit(1);
                      }
                      $$ = $1 / $3;
                   }
   | '(' exp ')'   { $$ = $2; }
   ;

%%

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}
