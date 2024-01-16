// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "halfduplex.h"
#include <ctype.h>

int main(int argc, char *argv[])
{
     int fd;

    /* Check if an argument was specified. */
    if (argc != 2) {
       printf("Usage : %s <pipe name>n", argv[0]);
       exit (1);
    }

    char buf[MAX_BUF_SIZE];

    /* Open the pipe for writing */
    fd = open(argv[1], O_WRONLY);

    printf("Enter lines of text, ^D to quit:\n");

    while (fgets(buf, sizeof buf, stdin) != NULL)
    {
        int len = strlen(buf);

	/* ditch newline at end, if it exists */
        if (buf[len - 1] == '\n')
            buf[len - 1] = '\0';

        /* Write to the pipe */
        write(fd, buf, len);
    }

    return 0;
}
