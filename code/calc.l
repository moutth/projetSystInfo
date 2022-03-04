%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

" " 	{}
"\t"	{}
"," { return tVIR; }
"\n"	{}
";" { return tPV; }
[0-9]+(.[0-9]*)?	{
	  yylval.nb = atoi(yytext);
	  return tNB;
	}
"="	{ return tEGAL; }
"-"	{ return tSOU; }
"+"	{ return tADD; }
"*"	{ return tMUL; }
"/"	{ return tDIV; }
"("	{ return tPO; }
")"	{ return tPF; }
"{" { return tACCO; }
"}" { return tACCF; }

"const" { return tCONST; }
"main" { return tMAIN; }
"int" { return tINT; }
"printf" { return tPRINTF; } /* PAS SUUUUR */


[a-zA-Z][0-9a-zA-Z_]*	{
	  yylval.var = yytext[0];
	  return tID;
	}

.	{ return tERROR; }
