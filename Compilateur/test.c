#include "ts.h"
#include <stdio.h>
#include <stdlib.h>

void main(){
    printts();
    newDepthts();
    pushts("a",INT);
    printts();
    newDepthts();
    pushts("b",INT);
    pushts("c",INT);
    pushts("x",INT);
    printts();
    popts();
    printts();
    popts();
    printts();
    newDepthts();
    pushts("newVar",INT);
    pushts("encoreUne",INT);
    printts();
    printf("\naddress of newVar : %d\n", adrmem("newVar"));
    popts();
    printts();
}