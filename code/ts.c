#include "ts.h"

tabSymbole table;

void initts(){
    table.first = NULL;
    table.last = NULL;
    table.firstOfDepth = NULL;
    table.size = 0;
    table.lastDepth = 0;
    table.depth = 0;
}

void newDepthts(){
    table.depth++;
    printf("\nNew depth created.");
}

void pushts(char * name, int type){
    // depth must be current table depth or current table depth + 1
    if(table.depth < 0 || table.depth < table.lastDepth || table.depth > table.lastDepth + 1){
        printf("\n!Incorrect depth!\n");
    } else {
        // Table vide
        if (table.first == NULL){
            table.size = 1;
            table.first = malloc(sizeof(symbole));
            table.first->name = name;
            table.first->depth = table.depth;
            table.first->type = type;
            table.first->adr = OFFSET_MEM;
            table.last = table.first;
        } else { //Table non vide
            table.size ++;
            table.last->next = malloc(sizeof(symbole));
            table.last = table.last->next;
            table.last->name = name;
            table.last->depth = table.depth;
            table.last->type = type;
            table.last->adr = table.size * OFFSET_MEM;
        }
        // Si on vient de démarrer un nouvel étage de profondeur
        if (table.depth == table.lastDepth + 1) {
            table.lastDepth = table.depth;
            table.firstOfDepth = table.last;
        }
    } 
    printf("\nInsertion : %s, depth %d\n", name, table.depth);
}

void popts(){
    int depthToRemove = table.depth;
    symbole * current = table.first;
    symbole * next;
    int foundNewLast = 0;
    if (depthToRemove == 1){
        foundNewLast = 1;
        table.last = NULL;
        table.first = NULL;
        table.firstOfDepth = NULL;
        table.lastDepth --;
    }
    if (current != NULL) {
        next = current->next;
        while(next != NULL){
            // Look for the first element of depth max-1 to set the first elt of the new last depth
            if (current->depth == table.lastDepth - 1){
                table.firstOfDepth = current;
                table.lastDepth --;
            }
            // Look for the last element of depth max-1 to set the last elt of the new list
            if (!foundNewLast && next->depth == depthToRemove){
                foundNewLast = 1;
                table.last = current;
            }
            //remove all from max depth
            if (current->depth == depthToRemove){
                free(current);
                table.size --;
            }
            current = next;
            next = current->next;
        }
    }
    //remove last
    if (current->depth == depthToRemove){
        free(current);
        table.size --;
    }
    table.depth--;
    printf("\nDepth %d erased\n", depthToRemove);
}

void printts(){
    symbole * current = table.first;
    char * typeStr;
    printf("\nTable des symboles :\n");
    if (table.first != NULL)
    {
        printf("Size : %d, depth : %d\n", table.size, table.lastDepth);
        for (int i = 0; i < table.size; i++)
        {
            switch (current->type){     //switch over the DEFINEd types
                case INT:
                typeStr = "int";
                break;
                default:
                typeStr = "unknown";
            }
            printf("type : %s, name : %s, adr : %d, table.depth : %d, value : %d\n", typeStr, current->name, current->adr, current->depth, current->value);
            current = current->next;
        }
    } else {
        printf("Table vide\n");
    }
}

symbole* fromts(char * name){
    symbole * current = table.firstOfDepth;
    while(strcmp(name, current->name) && current->next != NULL){
        current = current->next;
    }
    return current;
}

int adr(char * name){
    int ret_value;
    // the var for operation storage and for hard coded numbers are not in the table
    if (!strcmp(OP_VAR, name)){
        ret_value = AD_OP_VAR;
    } else if (isdigit(name[0])){
        ret_value = table.last->adr + atoi(name) * OFFSET_MEM;
    } else {
        ret_value = fromts(name)->adr;
    }
    return ret_value;
}

int currentTemp = 0;
void newTemp(){
    currentTemp ++;
}
void clearTemp(){
    currentTemp = 0;
}

int adrTemp(){
    // store temp var after the table in memory
    return table.last->adr + currentTemp * OFFSET_MEM;
}
char * nameTemp(){
    // give a name for the temp var to make it easier to use
    // it can be treated like a classical var thanks to this
    char * buff = malloc(4*sizeof(char));
    snprintf(buff, 4, "%d", currentTemp);
    return buff;
}