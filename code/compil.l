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
[0-9]+(\.[0-9]*)?(e[0-9]*)?	{
	  yylval.nb = atoi(yytext);
	  return tNB;
	}
"="	{ return tAFFECT; }
"-"	{ return tSOU; }
"+"	{ return tADD; }
"*"	{ return tMUL; }
"/"	{ return tDIV; }
"("	{ return tPO; }
")"	{ return tPF; }
"{" { return tACCO; }
"}" { return tACCF; }
"==" { return tEGAL; }
"<=" { return tINFEG; }
">=" { return tSUPEG; }
"<" { return tINF; }
">" { return tSUP; }

"const" { return tCONST; }
"main" { return tMAIN; }
"int" { return tINT; }
"printf" { return tPRINTF; }
"if" {return tIF; }
"else" {return tELSE; }
"while" {return tWHILE; }


[a-zA-Z][0-9a-zA-Z_]*	{
	  yylval.var=strdup(yytext);
	  return tID;
	}

.	{ return tERROR; }
