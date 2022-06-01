#include "ts.h"

tabSymbole table = {.size = 0, .lastDepth = 0};

int depth = 0;

void newDepthts(){
    depth++;
    printf("\nNew depth created.");
}

void pushts(char * name, int type){
    // depth must be current table depth or current table depth + 1
    if(depth < 0 || depth < table.lastDepth || depth > table.lastDepth + 1){
        printf("\n!Incorrect depth!\n");
    } else {
        // Table vide
        if (table.first == NULL){
            table.size = 1;
            table.first = malloc(sizeof(symbole));
            table.first->name = name;
            table.first->depth = depth;
            table.first->type = type;
            table.first->adr = table.size * 2;
            table.last = table.first;
        } else { //Table non vide
            table.size ++;
            table.last->next = malloc(sizeof(symbole));
            table.last = table.last->next;
            table.last->name = name;
            table.last->depth = depth;
            table.last->type = type;
            table.last->adr = table.size * 2;
        }
        // Si on vient de démarrer un nouvel étage de profondeur
        if (depth == table.lastDepth + 1) {
            table.lastDepth = depth;
            table.firstOfDepth = table.last;
        }
    } 
    printf("\nInsertion : %s, depth %d\n", name, depth);
}

void popts(){
    int depthToRemove = table.lastDepth;
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
    depth--;
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
            printf("type : %s, name : %s, adr : %d, depth : %d, value : %d\n", typeStr, current->name, current->adr, current->depth, current->value);
            current = current->next;
        }
    } else {
        printf("Table vide\n");
    }
}

symbole* fromts(char * name){
    symbole * current = table.firstOfDepth;
    while(current->name != name && current->next != NULL){
        current = current->next;
    }
    // Si on a pas trouvé de match le return vaut NULL
    return current;
}

int adr(char * name){
    return fromts(name)->adr;
}

int adrtemp(char * name){
    return fromts(name)->adr + OFFSET_MEM;
}

int adrtemp(){
    return 0;
}