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

// Insert a var with the given name, depth and type
// depth must be current table depth or current table depth + 1
void push(char * name, int depth, int type);

// Free all the var from the deeper depth then update the current depth
void pop();

void printTable();

// Retreive a symbole given its name
// Return an empty symbole if the symbole could'nt be found
symbole inTable(char * name);