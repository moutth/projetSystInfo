%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
void yyerror(char *s);
%}
%union { int nb; char var; }
%token tEGAL tPO tPF tSOU tADD tDIV tMUL tERROR tMAIN tACCO tACCF tESP tTAB tVIR tEOL tPV tCONST tINT tPRINTF
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme
%start Compilo
%%
Compilo :  tMAIN tPO tPF Bloc ;
Bloc : Instruction | tACCO SuiteInstructions tACCF ;
SuiteInstructions : Instruction | Instruction SuiteInstructions ;
Instruction : Declaration tPV | Calcul tPV ; /* à ordonner */
Declaration : tINT SuiteDeclarations | tCONST tINT SuiteDeclarations ;
SuiteDeclarations : Initialisation tVIR SuiteDeclarations | Initialisation ;
Initialisation : tID | tID tEGAL tNB ;


Calculatrice :	  Calcul Calculatrice | Calcul ;
Calcul :	  Expr tEOL { printf("> %d\n", $1); }
		| tID tEGAL Expr tEOL { var[(int)$1] = $3; } ;
Expr :		  Expr tADD DivMul { $$ = $1 + $3; }
		| Expr tSOU DivMul { $$ = $1 - $3; }
		| DivMul { $$ = $1; } ;
DivMul :	  DivMul tMUL Terme { $$ = $1 * $3; }
		| DivMul tDIV Terme { $$ = $1 / $3; }
		| Terme { $$ = $1; } ;
Terme :		  tPO Expr tPF { $$ = $2; }
		| tID { $$ = var[$1]; }
		| tNB { $$ = $1; } ;
%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Calculatrice\n"); // yydebug=1;
  yyparse();
  return 0;
}
