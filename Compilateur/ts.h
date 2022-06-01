#include <stdio.h>
#include <stdlib.h>

#define INT 1
#define FLOAT 2

#define OFFSET_MEM 1

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

// Find adress of the temp var associated to a var
int adrtemp(char * name);

// Return a free adress to store a hard coded value
int adrtemp();

void newDepthts();