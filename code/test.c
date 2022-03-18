#include "ts.h"
#include <stdio.h>
#include <stdlib.h>

void main(){
    printTable();
    push("a",1,INT);
    printTable();
    push("b",2,INT);
    push("c",2,INT);
    printTable();
    pop();
    printTable();
    pop();
    printTable();
    push("newVar",1,INT);
    push("encoreUne",1,INT);
    printf("%d", inTable("newVar").id);
    printTable();
    pop();
    printTable();
}