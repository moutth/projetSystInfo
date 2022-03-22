#include <stdio.h>
#include <stdlib.h>

#define INT 1
#define FLOAT 2

typedef struct symbole symbole;
typedef struct tabSymbole tabSymbole;

struct symbole {
    int type;
    char* name;
    int id;
    int depth;
    symbole* next;
};

struct tabSymbole {
    symbole* first;
    symbole* last;
    symbole* firstOfDepth;
    int size;
    int lastDepth;
};

void push(char * name, int depth, int type);

void pop();

void printTable();

symbole inTable(char * name);