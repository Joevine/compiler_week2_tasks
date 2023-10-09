%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z_0-9]* {
    printf("Valid Identifier: %s\n", yytext);
}
. {
    printf("Invalid Identifier: %s\n", yytext);
}
%%

int main() {
    yylex();
    return 0;
}
