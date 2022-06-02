#include "ta.h"

FILE * file;

void initFile(char * fileName){
    if((file = fopen(fileName, "w+")) == NULL){
        fprintf(stderr, "Opening of file failed\n");
    }
}

int nbLines = 0;

void insert(int numIns, int resultat, int op1, int op2){
    nbLines ++;
    switch (numIns)
    {
    case ADD:
    case MUL:
    case SOU:
    case DIV:
    case INF:
    case SUP:
    case EQU:
        fprintf(file, "%d %d %d %d\n", numIns, resultat, op1, op2);
        break;
    case COP:
    case AFC:
        fprintf(file, "%d %d %d\n", numIns, resultat, op1);
        break;
    case PRI:
        fprintf(file, "%d %d\n", numIns, resultat);
        break;
    default:
        fprintf(file, "translation error : %d %d %d %d\n", numIns, resultat, op1, op2);
        break;
    }
}


long savedLinePile[MAX_NESTED_CONDITIONS];
int lineNbPile[MAX_NESTED_CONDITIONS];
int lastLineSaved = -1;
int nbPush = -1;

void saveLine(int numIns, int adCompResult){
    if(lastLineSaved == MAX_NESTED_CONDITIONS-1){
        fprintf(stderr, "Too much nested conditions\n");
    } else {
        lastLineSaved ++;
        nbLines ++;
        if(numIns == JMF){
            fprintf(file, "%d %d ", JMF, adCompResult);
        } else if(numIns == JMP){
            fprintf(file, "%d ", JMP);
        } else {
            fprintf(stderr, "saveLine() only waits for JMP or JMF as an argument\n");
        }
        savedLinePile[lastLineSaved] = ftell(file);
        fprintf(file, "    \n"); //save the place that will be overwritten when writting the destination of the JM
    }
}


void pushLineNb() {
    if(nbPush == MAX_NESTED_CONDITIONS-1){
        fprintf(stderr, "Too much nested conditions\n");
    } else {
        nbPush++;
        lineNbPile[nbPush] = nbLines + 1;
    }
}

void writeLine(){
    long posSave = ftell(file);
    fseek(file, savedLinePile[lastLineSaved], SEEK_SET);
    printf("\n%d %d\n", lastLineSaved, lineNbPile[nbPush]);
    fprintf(file, "%d ", lineNbPile[nbPush]);
    fseek(file, posSave, SEEK_SET);
    lastLineSaved --;
    nbPush--;
}
