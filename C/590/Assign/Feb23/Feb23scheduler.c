// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// scheduler c
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

int main(int argc, char *argv[])
{
    // Check for number of arguments
    if (argc == 4)
    {
        int num_workers = atoi(argv[1]);
        char len_timeslice = argv[2];
        char algorithm[2] = argv[3];
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