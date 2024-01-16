// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// Queue c
#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

// Initialize queue
void createCQueue(cQueue *q, int size)
{
    q->size = size;
    q->start = 0;
    q->end = 0;
    q->numElements = 0;
    q->array = malloc(sizeof(int) * q->size);
}

// Get queue size
int cQueueSize(cQueue *q)
{
    return (q->numElements);
}

// Check if queue is empty
int cQueueEmpty(cQueue *q)
{
    return (q->numElements == 0);
}

// Check if queue is full
int cQueueFull(cQueue *q)
{
    return (q->numElements == q->size);
}

// Add new item into queue
int cQueueEnqueue(cQueue *q, int newItem)
{
    if (cQueueFull(q))
        return 0;

    q->array[q->end] = newItem;
    q->end = (q->end + 1) % q->size; // Change end value
    q->numElements++;

    return 1;
}

// Remove item from queue
int cQueueDequeue(cQueue *q)
{
    int val;
    if (cQueueEmpty(q))
        return 0;

    val = q->array[q->start];
    q->start = (q->start + 1) % q->size; // Change start value
    q->numElements--;

    return val;
}

// Get start of the queue
int cQueuestart(cQueue *q)
{
    if (cQueueEmpty(q))
        return 0;

    return q->array[q->start];
}

// get end of queue
int cQueueend(cQueue *q)
{
    if (cQueueEmpty(q))
        return 0;

    return q->array[(q->end - 1 + q->size) % q->size];
}

// Remove elements from queue
void cQueueClear(cQueue *q)
{
    free(q->array);
}