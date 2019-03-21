%{

#include <string.h>
int acca = 0;
int accb = 0;
int accc = 0;

/* Criteiros de desempate:
   1 - Maior match
   2 - Regra que vem antes */
%}


LETRA   [a-zA-Z]
DIGITO  [0-9]

PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+

%%

[a-zA-Z0-9]+[@]({PALAVRA}[.])*(fee.unicamp[.]br) {accc++; accb++, acca++;}
[a-zA-Z0-9]+[@]({PALAVRA}[.])*(unicamp[.]br) {accb++; acca++;}
[a-zA-Z0-9]+[@][a-z]+([.]{PALAVRA})* {acca++;}


[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;


%%

int main() {
  yylex();
  printf("%d %d %d\n", acca, accb, accc);
  return 0;
}
