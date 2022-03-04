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
    tEGAL = 258,
    tPO = 259,
    tPF = 260,
    tSOU = 261,
    tADD = 262,
    tDIV = 263,
    tMUL = 264,
    tERROR = 265,
    tMAIN = 266,
    tACCO = 267,
    tACCF = 268,
    tESP = 269,
    tTAB = 270,
    tVIR = 271,
    tEOL = 272,
    tPV = 273,
    tCONST = 274,
    tINT = 275,
    tPRINTF = 276,
    tNB = 277,
    tID = 278
  };
#endif
/* Tokens.  */
#define tEGAL 258
#define tPO 259
#define tPF 260
#define tSOU 261
#define tADD 262
#define tDIV 263
#define tMUL 264
#define tERROR 265
#define tMAIN 266
#define tACCO 267
#define tACCF 268
#define tESP 269
#define tTAB 270
#define tVIR 271
#define tEOL 272
#define tPV 273
#define tCONST 274
#define tINT 275
#define tPRINTF 276
#define tNB 277
#define tID 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 7 "compil.y"
 int nb; char var; 

#line 106 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
