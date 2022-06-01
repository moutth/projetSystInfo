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
int lastSavedLine = -1;
int lastRetrieved = -1;

void saveLine(int numIns, int adCompResult){
    lastSavedLine ++;
    if(lastSavedLine > MAX_NESTED_CONDITIONS-1){
        fprintf(stderr, "Too much nested conditions\n");
    } else {
        if(numIns == JMF){
            nbLines ++;
            fprintf(file, "%d %d ", JMF, adCompResult);
        } else if(numIns == JMP){
            nbLines ++;
            fprintf(file, "%d ", JMP);
        }
        savedLinePile[lastSavedLine] = ftell(file); 
        fprintf(file, "    \n"); //save the place that will be overwritten when writting the destination of the JM
    }
}

void retrieveLine(){
    lastRetrieved ++;
    long posSave = ftell(file);
    fseek(file, savedLinePile[lastRetrieved], SEEK_SET);
    fprintf(file, "%d ", nbLines+1);
    fseek(file, posSave, SEEK_SET);
}
