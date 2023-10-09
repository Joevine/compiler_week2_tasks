%{
#include "calculator.tab.h"
%}

%%
[0-9]+ {
    yylval = atof(yytext);
    return NUMBER;
}
[-+\*/\(\)\n] {
    return yytext[0];
}
[ \t] {
    /* Ignore whitespace */
}
. {
    fprintf(stderr, "Error: Invalid character '%s'\n", yytext);
}

%%

int yywrap() {
    return 1;
}
