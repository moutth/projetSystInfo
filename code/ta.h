#ifndef TA_H
#define TA_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ts.h"

#define MAX_NESTED_CONDITIONS 50

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

#define UNUSED 0
void insert(int numIns, int resultat, int op1, int op2); //numIns entre 1 et 12 (cf DEFINE)

void initFile(char * fileName);

void saveLine();

void retrieveLine();

#endif