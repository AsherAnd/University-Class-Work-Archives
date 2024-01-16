#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "usage: %s PID\n", argv[0]);
        exit(1);
    }

    long pid = atol(argv[1]);
    kill(pid, SIGKILL);
    printf("The process with PID %ld has been killed using SIGKILL.\n", pid);

    return 0;
}