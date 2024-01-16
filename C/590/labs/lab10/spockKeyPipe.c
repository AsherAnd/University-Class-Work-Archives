// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "halfduplex.h"

int main(int argc, char *argv[])
{
    int fd, ret_val, count, numread;
    char buf[MAX_BUF_SIZE];

    if (argc != 2)
    {
        	exit(1);
    }

    /* Create the named - pipe */
    ret_val = mkfifo(argv[1], 0666);

    if ((ret_val == -1) && (errno != EEXIST)) {
 	perror("Error creating the named pipe");
 	exit (1);
    }

    /* Open the pipe for reading */
    fd = open(argv[1], O_RDONLY);

    printf("spock: ready to receive messages, captain.\n");

    for (;;)
    { 
        /* Spock never quits! */
        /* Read from the pipe */
        numread = read(fd, buf, MAX_BUF_SIZE);
	
	if(numread == 0)
	{
    	  printf("Program ended.\n");
	  exit(1);
	}	

        printf("spock: \"%s\"\n", buf);
    }

    return 0;
}