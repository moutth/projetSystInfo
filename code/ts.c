#include "ts.h"

void push(char * name, int depth, int type){
    table.size ++;
    if (table.first == NULL){
        table.first = malloc(sizeof(symbole));
        table.first->name = name;
        table.first->depth = depth;
        table.first->type = type;
        table.first->id = table.size; //table.size = 0+1 = 1
        table.last = table.first;
    } else {
        table.last->next = malloc(sizeof(symbole));
        table.last = table.last->next;
        table.last->name = name;
        table.last->depth = depth;
        table.last->type = type;
        table.last->id = table.size;
    }
}

void pop(){
    int depthToRemove = table.last->depth;
    symbole * current = table.first;
    symbole * next = current->next;
    int foundNewLast = 0;
    while(next != NULL){
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

void printTable(){
    symbole * current = table.first;
    char * typeStr;
    for (int i = 0; i < table.size; i++)
    {
        switch (current->type){
            case INT:
            typeStr = "int";
            break;
            default:
            typeStr = "unknown";
        }
        printf("type : %s, name : %s, id : %d, depth : %d\n", typeStr, current->name, current->id, current->depth);
        current = current->next;
    }
}