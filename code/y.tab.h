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
    tVIR = 268,
    tPV = 269,
    tCONST = 270,
    tINT = 271,
    tPRINTF = 272,
    tEGAL = 273,
    tINFEG = 274,
    tSUPEG = 275,
    tINF = 276,
    tSUP = 277,
    tIF = 278,
    tELSE = 279,
    tERROR = 280,
    tNB = 281,
    tID = 282
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
#define tVIR 268
#define tPV 269
#define tCONST 270
#define tINT 271
#define tPRINTF 272
#define tEGAL 273
#define tINFEG 274
#define tSUPEG 275
#define tINF 276
#define tSUP 277
#define tIF 278
#define tELSE 279
#define tERROR 280
#define tNB 281
#define tID 282

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 9 "compil.y"
 int nb; char* var; 

#line 114 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
