#ifndef TS_H
#define TS_H
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define INT 1
#define FLOAT 2

#define OFFSET_MEM 1 //size of one var in memory

#define AD_OP_VAR 0 //@ for the value of the current operation

#define OP_VAR "_op_var_"

typedef struct symbole symbole;
typedef struct tabSymbole tabSymbole;

struct symbole {
    int type;
    char* name;
    int adr;
    int value;
    int depth;
    symbole* next;
};

struct tabSymbole {
    symbole* first;
    symbole* last;
    symbole* firstOfDepth;
    int size;
    int lastDepth;
    int depth;
};

// Insert a var with the given name and type
void pushts(char * name, int type);

// Free all the var from the deeper depth then update the current depth
void popts();

void printts();

// Retreive a symbole given its name
// Return an empty symbole if the symbole could'nt be found
symbole* fromts(char * name);

// Find adress of a var given its name
int adr(char * name);

// Return a free adress to store a hard coded value
int adrtemp();

void newDepthts();

void initts();

void newTemp();

char * nameTemp();

int adrTemp();

void clearTemp();

#endif