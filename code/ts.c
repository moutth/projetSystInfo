#include "ts.h"

void push(char * name, int depth, int type){
    if(depth <= 0 || depth < table.lastDepth || depth > table.lastDepth + 1){
        printf("\n!Incorrect depth!\n");
    } else {
        // Table vide
        if (table.first == NULL){
            table.size = 1;
            table.first = malloc(sizeof(symbole));
            table.first->name = name;
            table.first->depth = depth;
            table.first->type = type;
            table.first->id = table.size;
            table.last = table.first;
        } else { //Table non vide
            table.size ++;
            table.last->next = malloc(sizeof(symbole));
            table.last = table.last->next;
            table.last->name = name;
            table.last->depth = depth;
            table.last->type = type;
            table.last->id = table.size;
        }
        // Si on vient de démarrer un nouvel étage de profondeur
        if (depth == table.lastDepth + 1) {
            table.lastDepth = depth;
            table.firstOfDepth = table.last;
        }
    } 
    printf("\nInsertion : %s, depth %d\n", name, depth);
}

void pop(){
    int depthToRemove = table.lastDepth;
    symbole * current = table.first;
    symbole * next;
    int foundNewLast = 0;
    int foundNewFirst = 0;
    if (depthToRemove == 1){
        foundNewLast = 1;
        foundNewFirst = 1;
        table.last = NULL;
        table.first = NULL;
        table.firstOfDepth = NULL;
    }
    if (current != NULL) {
        next = current->next;
        while(next != NULL){
            // Look for the first element of depth max-1 to set the first elt of the last depth of the new list
            if (current->depth == table.lastDepth - 1){
                foundNewFirst = 1;
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
    printf("\nDepth %d erased\n", depthToRemove);
}

void printTable(){
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
            printf("type : %s, name : %s, id : %d, depth : %d\n", typeStr, current->name, current->id, current->depth);
            current = current->next;
        }
    } else {
        printf("Table vide\n");
    }
}

symbole inTable(char * name){
    // ERR ICI
    symbole * current = table.firstOfDepth;
    symbole err;
    while(current->name != name && current->next != NULL){
        current = current->next;
    }
    // Si on a trouvé un match
    if (current != NULL) {
        return *current;
    } else {
        return err;
    }
}