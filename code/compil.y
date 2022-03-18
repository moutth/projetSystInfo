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
Compilo : tMAIN tPO tPF Bloc ;
Bloc : Ligne | tACCO SuiteDeclarations SuiteInstructions tACCF | tACCO SuiteDeclarations tACCF | tACCO SuiteInstructions tACCF | tACCO tACCF ;
Ligne : LigneDeclaration | LigneCalcul | tPV ;

SuiteDeclarations : LigneDeclaration | LigneDeclaration SuiteDeclarations ;
LigneDeclaration : tINT Declaration tPV | tCONST tINT Declaration tPV ;
Declaration : Initialisation tVIR Declaration | Initialisation ;
Initialisation : tID | tID tEGAL tNB ;


SuiteInstructions : Instruction | Instruction SuiteInstructions ;
Instruction : LigneCalcul | LignePrintf ;
LignePrintf : tPRINTF tPO tID tPF tPV ;
LigneCalcul : Calcul tPV;
// TODO: prendre en compte parenthesess
Calcul : Expr { printf("> %d\n", $1); }
		| tID tEGAL Expr { var[(int)$1] = $3; } ;
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
  // yydebug=1;
  yyparse();
  return 0;
}
