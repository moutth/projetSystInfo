#include "ta.h"

void insert(int numIns, int resultat, int op1, int op2){
    char* ligneASM = itoa(numIns);
    switch (numIns)
    {
    case ADD:
    case MUL:
    case SOU:
    case DIV:
    case INF:
    case SUP:
    case EQU:
        ligneASM += ' ' + itoa(resultat) + itoa(op1) + itoa(op2);
        break;
    case COP:
    case AFC:
    case JMF:
        ligneASM += ' ' + itoa(resultat) + itoa(op1);
        break;
    case JMP:
    case PRI:
        ligneASM += ' ' + itoa(resultat);
        break;

    default:
        ligneASM = NULL;
        break;
    }
    printf("%s", ligneASM);
}