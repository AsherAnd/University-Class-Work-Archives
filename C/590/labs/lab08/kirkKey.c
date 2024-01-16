// Asher Andargachew
// 501101885
// aandargachew@torontomu.ca
// From: http://beej.us/guide/bgipc/output/html/multipage/mq.html
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
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
    {
        perror("int");
        exit(1);
    }

    if ((msqid = msgget(key, 0666 | IPC_CREAT)) == -1)
    {
        perror("msgget");
        exit(1);
    }

    printf("Enter lines of text, ^D to quit:\n");

    buf.mtype = 1; /* we don't really care in this case */

    while (fgets(buf.mtext, sizeof buf.mtext, stdin) != NULL)
    {
        int len = strlen(buf.mtext);

        /* ditch newline at end, if it exists */
        if (buf.mtext[len - 1] == '\n')
            buf.mtext[len - 1] = '\0';

        if (msgsnd(msqid, &buf, len + 1, 0) == -1) /* +1 for '\0' */
            perror("msgsnd");
    }

    if (msgctl(msqid, IPC_RMID, NULL) == -1)
    {
        perror("msgctl");
        exit(1);
    }

    return 0;
}
