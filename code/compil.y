%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.h"
int var[26];
void yyerror(char *s);
%}
%union { int nb; char var; }
%token tAFFECT tPO tPF tSOU tADD tDIV tMUL tMAIN tACCO tACCF tVIR tPV tCONST tINT tPRINTF tEGAL tINFEG tSUPEG tINF tSUP
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme
%start Compilo
%%
Compilo : tMAIN tPO tPF Bloc ;

Bloc : Ligne 
	 | tACCO SuiteDeclarations SuiteInstructions tACCF 
	 | tACCO SuiteDeclarations tACCF 
	 | tACCO SuiteInstructions tACCF 
	 | tACCO tACCF ;
	 | If ;

If : Condition Bloc Else
   | Condition Bloc ;

Else : Bloc ;

Condition : tPO Comparaison tPF ;
	 
Comparaison : Terme tEGAL Terme
			| Terme tINF Terme
			| Terme tSUP Terme
			| Terme tINFEG Terme
			| Terme tSUPEG Terme
			| Terme ;

Ligne : LigneDeclaration 
	  | LigneCalcul 
	  | tPV ;

SuiteDeclarations : LigneDeclaration 
				  | LigneDeclaration SuiteDeclarations ;

LigneDeclaration : tINT Declaration tPV 
  				 | tCONST tINT Declaration tPV ;

Declaration : Initialisation tVIR Declaration 
		    | Initialisation ;

Initialisation : tID 
			   | tID tAFFECT tNB ;


SuiteInstructions : Instruction 
				  | Instruction SuiteInstructions ;

Instruction : LigneCalcul 
			| LignePrintf ;

LignePrintf : tPRINTF tPO tID tPF tPV ;
LigneCalcul : Calcul tPV;

// TODO: prendre en compte parenthesess
Calcul : Expr { printf("> %d\n", $1); }
	   | tID tAFFECT Expr { var[(int)$1] = $3; } ;
Expr : Expr tADD DivMul { $$ = $1 + $3; }
	 | Expr tSOU DivMul { $$ = $1 - $3; }
	 | DivMul { $$ = $1; } ;
DivMul : DivMul tMUL Terme { $$ = $1 * $3; }
	   | DivMul tDIV Terme { $$ = $1 / $3; }
	   | Terme { $$ = $1; } ;
Terme : tPO Expr tPF { $$ = $2; }
	  | tID { $$ = var[$1]; }
	  | tNB { $$ = $1; } ;
%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  // yydebug=1;
  yyparse();
  return 0;
}
