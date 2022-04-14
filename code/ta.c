#include "ta.h"

void insert(int numIns){
    char* ligneASM;
    switch (numIns)
    {
    case ADD:
    case MUL:
    case SOU:
    case DIV:
        ligneASM = NULL;
        break;

    case COP:
        /* code */
        break;

    case AFC:
        /* code */
        break;

    case JMP:
        /* code */
        break;

    case JMF:
        /* code */
        break;
    
    default:
        ligneASM = NULL;
        break;
    }
    printf("%s", ligneASM);
}