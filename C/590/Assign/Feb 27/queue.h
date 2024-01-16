// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// Queue h
#ifndef CIRCULARQUEUE
#define CIRCULARQUEUE

typedef struct
{
    int size;
    int start;
    int end;
    int numElements;
    int *array;
} cQueue;

// interface functions
void createCQueue(cQueue *q, int size);
int cQueueSize(cQueue *q);
int cQueueEmpty(cQueue *q);
int cQueueFull(cQueue *q);
int cQueueEnqueue(cQueue *q, int newItem);
int cQueueDequeue(cQueue *q);
int cQueuestart(cQueue *q);
int cQueueend(cQueue *q);
void cQueueClear(cQueue *q);
#endif