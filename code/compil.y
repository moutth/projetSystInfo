%{
#include <stdlib.h>
#include <stdio.h>
#include "ts.h"
#include "ta.h"

void yyerror(char *s);
%}
%union { int nb; char* var; }
%token tAFFECT tPO tPF tSOU tADD tDIV tMUL tMAIN tACCO tACCF tWHILE tVIR tPV tCONST tINT tPRINTF tEGAL tINFEG tSUPEG tINF tSUP tIF tELSE tERROR
%token <nb> tNB
%token <var> tID
%type <nb> Type
%type <var> Expr DivMul Terme Comparaison
%start Compilo
%%
Compilo : { initts(); } tMAIN tPO tPF Bloc ;

Bloc : { newDepthts(); } Ligne { popts(); }
	 | { newDepthts(); } tACCO CorpsBloc tACCF { popts(); } ; 

CorpsBloc : SuiteDeclarations SuiteInstructions 
		  | SuiteDeclarations 
		  | SuiteInstructions ;

Ligne : Declaration
	  | Instruction
	  | tPV ;

SuiteDeclarations : Declaration
				  | Declaration SuiteDeclarations ;

Declaration : Initialisation tVIR Declaration
		    | Initialisation tPV ;

Initialisation : Type tID { pushts($2, $1); }
			   | Type tID tAFFECT tNB { pushts($2, $1);
			   							insert(COP, adr($2), $4, UNUSED); } ;

Type : tINT { $$ = INT; } ;

SuiteInstructions : Instruction 
				  | Instruction SuiteInstructions ;

Instruction : Calcul tPV { clearTemp(); }
			| Printf tPV
			| tIF If ;

If : Condition Bloc { retrieveLine(); }
   | Condition Bloc Else { retrieveLine(); } ;

Else : tELSE { saveLine(JMP, UNUSED); retrieveLine(); } Bloc ;

Condition : tPO Comparaison tPF ;

Comparaison : Terme tEGAL Terme { newTemp();
								  insert(EQU, adrTemp(), adr($1), adr($3));
								  saveLine(JMF, adrTemp()); }
			| Terme tINF Terme { newTemp();
								 insert(INF, adrTemp(), adr($1), adr($3));
								 saveLine(JMF, adrTemp()); }
			| Terme tSUP Terme { newTemp();
								 insert(SUP, adrTemp(), adr($1), adr($3));
								 saveLine(JMF, adrTemp()); }
			| Terme tINFEG Terme { newTemp();
								   char * resINFEG = nameTemp();
								   insert(EQU, adrTemp(), adr($1), adr($3));
								   newTemp();
								   insert(INF, adrTemp(), adr($1), adr($3));
								   insert(ADD, adr(resINFEG), adrTemp(), adr(resINFEG));
								   insert(AFC, adrTemp(), 0, UNUSED);
								   insert(SUP, adrTemp(), adr(resINFEG), adrTemp());
								   saveLine(JMF, adrTemp()); }
			| Terme tSUPEG Terme { newTemp();
								   char * resINFEG = nameTemp();
								   insert(EQU, adrTemp(), adr($1), adr($3));
								   newTemp();
								   insert(SUP, adrTemp(), adr($1), adr($3));
								   insert(ADD, adr(resINFEG), adrTemp(), adr(resINFEG));
								   insert(AFC, adrTemp(), 0, UNUSED);
								   insert(SUP, adrTemp(), adr(resINFEG), adrTemp());
								   saveLine(JMF, adrTemp()); } ;

Printf : tPRINTF tPO tID tPF { insert(PRI, adr($3), UNUSED, UNUSED); } ;

Calcul : Expr //pas d'affecctation, on ne fait rien car calcul inutile
	   | tID tAFFECT Expr { insert(COP, adr($1), adr($3), UNUSED); } ;

Expr : Expr tADD DivMul { insert(ADD, adr(OP_VAR), adr($1), adr($3));
		   				  $$ = OP_VAR; }
	 | Expr tSOU DivMul { insert(SOU, adr(OP_VAR), adr($1), adr($3));
		   				  $$ = OP_VAR; }
	 | DivMul { $$ = $1; } ;

DivMul : DivMul tMUL Terme { insert(MUL, adr(OP_VAR), adr($1), adr($3));
		   					 $$ = OP_VAR; }
	   | DivMul tDIV Terme { insert(DIV, adr(OP_VAR), adr($1), adr($3));
		   					 $$ = OP_VAR; }
	   | Terme { $$ = $1; } ;

Terme : tPO Expr tPF { $$ = $2; }
	  | tNB { newTemp();
		  	  insert(AFC, adrTemp(), $1, UNUSED);
	  		  $$ = nameTemp(); }
	  | tID { $$ = $1; } ;

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }

int main(int argc, char * argv[]) {
	initFile(argv[1]);
	yyparse();
	return 0;
}
