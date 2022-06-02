/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tAFFECT = 258,
    tPO = 259,
    tPF = 260,
    tSOU = 261,
    tADD = 262,
    tDIV = 263,
    tMUL = 264,
    tMAIN = 265,
    tACCO = 266,
    tACCF = 267,
    tWHILE = 268,
    tVIR = 269,
    tPV = 270,
    tCONST = 271,
    tINT = 272,
    tPRINTF = 273,
    tEGAL = 274,
    tINFEG = 275,
    tSUPEG = 276,
    tINF = 277,
    tSUP = 278,
    tIF = 279,
    tELSE = 280,
    tERROR = 281,
    tNB = 282,
    tID = 283
  };
#endif
/* Tokens.  */
#define tAFFECT 258
#define tPO 259
#define tPF 260
#define tSOU 261
#define tADD 262
#define tDIV 263
#define tMUL 264
#define tMAIN 265
#define tACCO 266
#define tACCF 267
#define tWHILE 268
#define tVIR 269
#define tPV 270
#define tCONST 271
#define tINT 272
#define tPRINTF 273
#define tEGAL 274
#define tINFEG 275
#define tSUPEG 276
#define tINF 277
#define tSUP 278
#define tIF 279
#define tELSE 280
#define tERROR 281
#define tNB 282
#define tID 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 9 "compil.y"
 int nb; char* var; 

#line 116 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
