#include "ts.h"
#include <stdio.h>
#include <stdlib.h>

void main(){
    prints();
    pushts("a",1,INT);
    prints();
    pushts("b",2,INT);
    pushts("c",2,INT);
    pushts("x",4,INT);
    prints();
    popts();
    prints();
    popts();
    prints();
    pushts("newVar",1,INT);
    pushts("encoreUne",1,INT);
    prints();
    printf("\nid of newVar : %d\n", fromts("newVar").id);
    popts();
    prints();
}