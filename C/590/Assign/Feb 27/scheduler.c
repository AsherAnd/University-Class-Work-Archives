// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// scheduler c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include "queue.h"

// Global counter and current worker of workers
int counter = 0;
int currentWorker = 0;

// Check to see if all workers have finished
int allWorkersComplete(cQueue *workers, int numWorkers)
{
    int complete = 1;
    for (int i = 0; i < numWorkers; i++)
    {
        if (workers->array[i] != 0)
        {
            complete = 0;
            break;
        }
    }
    return complete;
}

// Which algorithm to use
int lenAlgorithm(cQueue *workers, int numWorkers, int lenTimeslice, char *algorithm)
{
    // Check which algorithm to use
    if (strcmp(algorithm, "RR") == 0)
    {
        counter++;
        int next = (currentWorker + 1) % numWorkers;
        if (workers->array[next] == 0)
        {
            currentWorker = next;
        }
        workers->array[currentWorker] = counter;

        return lenTimeslice;
    }
    else if (strcmp(algorithm, "L7") == 0)
        // Check to see the if the pid of the worker needs to be doubled
        return 0;
    else
    {
        printf("No valid scheduling algorithm passed!\n");
        exit(1);
    }
}

int main(int argc, char *argv[])
{
    // Check for number of arguments
    if (argc == 4)
    {
        int numWorkers = atoi(argv[1]);
        int lenTimeslice = atoi(argv[2]);
        char *algorithm = argv[3];
        cQueue workers;

        // Create queue of workers
        createCQueue(&workers, numWorkers);

        // Wait for all workers to request scheduling
        // Repeat the following until all workers have completed their task:
        while (1)
        {
            // allow the selected worker to run for its timeslice
            for (int i = 0; i < lenAlgorithm(&workers, numWorkers, lenTimeslice, algorithm); i++)
            {
                // worker executes for its timeslice
            }
            // Worker completes
            workers.array[currentWorker] = 0;

            if (allWorkersComplete(&workers, numWorkers))
                break;
        }
    }
    else if (argc > 4)
    {
        printf("Too many arguments supplied.\n");
    }
    else
    {
        printf("Three arguments expected.\n");
    }

    return 0;
}