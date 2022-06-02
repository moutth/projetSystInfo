#ifndef TA_H
#define TA_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ts.h"

#define MAX_NESTED_CONDITIONS 50

#define LAST_LINE_NB 1
#define PUSHED_LINE_NB 2

//ASM macros
#define UNUSED 0
#define ADD 1
#define MUL 2
#define SOU 3
#define DIV 4
#define COP 5
#define AFC 6
#define JMP 7
#define JMF 8
#define INF 9
#define SUP 10
#define EQU 11
#define PRI 12

void insert(int numIns, int resultat, int op1, int op2); //numIns is one of the ASM macros  (cf DEFINE)

void initFile(char * fileName);

void saveLine();

void pushLineNb();

void writeLine();

#endif