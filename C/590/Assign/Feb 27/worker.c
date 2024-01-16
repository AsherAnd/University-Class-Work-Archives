// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// worker c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

int main(int argc, char *argv[])
{
    // Check for number of arguments
    if (argc == 3)
    {
        int sPID = atoi(argv[2]);
        FILE *fp;

        // Create the file and open it for writing
        fp = fopen(argv[1], "w");
        if (fp == NULL)
            return -1;

        // Send signal to the scheduler
        if (kill(sPID, SIGUSR1) == -1)
        {
            perror("kill");
            exit(4);
        }

        // Wait for scheduler to acknowledge worker
        if (sigwaitinfo(&(const sigset_t){SIGUSR2}, NULL) == -1)
        {
            perror("sigwaitinfo");
            exit(5);
        }

        // Write *s into file
        for (int i = 0; i < 40; i++)
            fputc('*', fp);

        fputc('\n', fp);
        fclose(fp);

        // Tell scheduler task is complete
        if (kill(sPID, SIGUSR2) == -1)
        {
            perror("kill");
            exit(7);
        }
    }
    else if (argc > 3)
    {
        printf("Too many arguments supplied.\n");
    }
    else
    {
        printf("Two arguments expected.\n");
    }

    return 0;
}