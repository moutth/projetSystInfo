#include <stdio.h>
#include <stdlib.h>

#define INT 1
#define FLOAT 2

typedef struct {
    int type;
    char* name;
    int id;
    int depth;
    symbole* next = NULL;
} symbole;

typedef struct {
    symbole* first = NULL;
    symbole* last = NULL;
    int size = 0;
} tabSymbole;

tabSymbole table;

void push(char * name, int depth, int type = INT);

void pop();

void printTable();