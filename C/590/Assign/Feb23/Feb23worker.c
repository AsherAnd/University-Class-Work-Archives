// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// worker C
#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    // Check for number of arguments
    if (argc == 3)
    {
        FILE *fp;

        // Create the file and open it for writing
        fp = fopen(argv[1], "w");
        if (fp == NULL)
            return -1;

        int i;
        for (i = 0; i < 40; i++)
            fputc('*', fp);

        fputc('\n', fp);
        fclose(fp);
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