// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// From: http://beej.us/guide/bgipc/output/html/multipage/mq.html
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <ctype.h>

struct my_msgbuf
{
    long mtype;
    char mtext[200];
};

int main(int argc, char *argv[])
{
    char *p;
    if (argc < 2 || !strtol(argv[1], &p, 10))
    {
        exit(1);
    }

    struct my_msgbuf buf;
    int msqid;
    key_t key;

    if ((key = strtol(argv[1], &p, 10)) == -1)
    { /* same key as kirk.c */
        perror("int");
        exit(1);
    }

    if ((msqid = msgget(key, 0666)) == -1)
    { /* connect to the queue */
        perror("msgget");
        exit(1);
    }

    printf("spock: ready to receive messages, captain.\n");

    for (;;)
    { /* Spock never quits! */
        if (msgrcv(msqid, &buf, sizeof(buf.mtext), 0, 0) == -1)
        {
            perror("msgrcv");
            exit(1);
        }
        printf("spock: \"%s\"\n", buf.mtext);
    }

    return 0;
}
