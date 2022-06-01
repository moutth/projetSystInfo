#include "ts.h"
#include <stdio.h>
#include <stdlib.h>

int main(){
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
    printf("\naddress of newVar : %d\n", adr("newVar"));
    popts();
    printts();
    newDepthts();
    popts();
}