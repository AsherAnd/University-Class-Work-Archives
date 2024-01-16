#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool strtol_wrapper_b10(const char *s, long *n);

int main(int argc, char *argv[])
{
    char *p;
    if (argc < 2 || !strtol(argv[1], &p, 10))
    {
        printf("One argument expected.\n");
        exit(1);
    }
    else
    {
        printf("Yup");
        exit(1);
    }
}

bool strtol_wrapper_b10(const char *s, long *n)
{
    char *p;

    *n = strtol(s, &p, 10);

    if (p == s)
        return false;
    else
        return true;
}