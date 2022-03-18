#include <stdio.h>
#include <stdlib.h>

#define INT 1
#define FLOAT 2

typedef struct symbole symbole;

struct symbole {
    int type;
    char* name;
    int id;
    int depth;
    symbole* next;
};

typedef struct {
    symbole* first;
    symbole* last;
    symbole* firstOfDepth;
    int size;
    int lastDepth;
} tabSymbole;

tabSymbole table;

void push(char * name, int depth, int type);

void pop();

void printTable();

symbole inTable(char * name);