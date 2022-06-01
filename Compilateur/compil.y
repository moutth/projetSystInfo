%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.h"
#include "ta.h"
void yyerror(char *s);
%}
%union { int nb; char* var; }
%token tAFFECT tPO tPF tSOU tADD tDIV tMUL tMAIN tACCO tACCF tVIR tPV tCONST tINT tPRINTF tEGAL tINFEG tSUPEG tINF tSUP tIF tELSE tERROR
%token <nb> tNB
%token <var> tID
%type <nb> Expr DivMul Terme Type
%type <var> ExprLitt DivMulLitt TermeLitt
%start Compilo
%%
Compilo : tMAIN tPO tPF Bloc ;

Bloc : { newDepthts(); } Ligne { popts(); }
	 | { newDepthts(); } tACCO CorpsBloc tACCF { popts(); } ; 

CorpsBloc : SuiteDeclarations SuiteInstructions 
		  | SuiteDeclarations 
		  | SuiteInstructions ;

If : Condition Bloc tELSE Bloc
   | Condition Bloc ;

Condition : tPO Comparaison tPF ;
	 
Comparaison : Terme tEGAL Terme
			| Terme tINF Terme
			| Terme tSUP Terme
			| Terme tINFEG Terme
			| Terme tSUPEG Terme
			| Terme ;

Ligne : Declaration 
	  | Instruction
	  | tPV ;

SuiteDeclarations : Declaration
				  | Declaration SuiteDeclarations ;

Declaration : Initialisation tVIR Declaration
		    | Initialisation tPV ;

Initialisation : Type tID { pushts($2, $1); }
			   | Type tID tAFFECT tNB { pushts($2, $1);
			   							fromts($2)->value = $4; } ;

Type : tINT { $$ = INT; } 
	 | tCONST tINT { $$ = INT; }; //TODO: Change to const
//TODO: float ici

SuiteInstructions : Instruction 
				  | Instruction SuiteInstructions ;

Instruction : Calcul tPV
			| Printf
			| tIF If ;

Printf : tPRINTF tPO tID tPF tPV { insert(PRI, adr($3)); } ;

Calcul : Expr //pas d'affecctation, on ne fait rien car calcul inutile
	   | tID tAFFECT Expr { insert(AFC, adr($1), $3); } 
	   | tID tAFFECT ExprLitt { insert(COP, adr($1), $3); } ;

Expr : Expr tADD DivMul { $$ = $1 + $3; }
	 | Expr tSOU DivMul { $$ = $1 - $3; }
	 | DivMul { $$ = $1; } ;

ExprLitt : ExprLitt tADD DivMul { insert(AFC, adrtemp(), $3);
								  insert(ADD, adrtemp($1), adr($1), adrtemp());
		   						  $$ = $1; }
	 	 | ExprLitt tSOU DivMul { insert(AFC, adrtemp(), $3);
								  insert(SOU, adrtemp($1), adr($1), adrtemp());
		   						  $$ = $1; }
	 	 | ExprLitt tADD DivMulLitt { insert(ADD, adr($1), adr($1), adr($3));
		  							  $$ = $1; }
	 	 | ExprLitt tSOU DivMulLitt { insert(SOU, adr($1), adr($1), adr($3));
		  							  $$ = $1; }
	 	 | DivMulLitt { $$ = $1; } ;

DivMul : DivMul tMUL Terme { $$ = $1 * $3; }
	   | DivMul tDIV Terme { $$ = $1 / $3; }
	   | Terme { $$ = $1; } ;

DivMulLitt : DivMulLitt tMUL Terme { insert(AFC, adrtemp(), $3);
									 insert(MUL, adrtemp($1), adr($1), adrtemp());
		   							 $$ = $1; }
	   | DivMulLitt tDIV Terme { insert(AFC, adrtemp(), $3);
								 insert(DIV, adrtemp($1), adr($1), adrtemp());
		   						 $$ = $1; }
	   | DivMulLitt tMUL TermeLitt { insert(MUL, adrtemp($1), adr($1), adr($3));
		   							 $$ = $1; }
	   | DivMulLitt tDIV TermeLitt { insert(DIV, adrtemp($1), adr($1), adr($3));
		   							 $$ = $1; }
	   | TermeLitt { $$ = $1; } ;

Terme : tPO Expr tPF { $$ = $2; }
	  | tNB { $$ = $1; } ;

TermeLitt : tPO ExprLitt tPF { $$ = $2; }
	  	  | tID { $$ = $1; } ; //on remonte le nom de la variable de gauche et on stocke dans son espace memoire temp

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  // yydebug=1;
  yyparse();
  return 0;
}
