#define _GNU_SOURCE  //for Ubuntu
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sched.h>

int x, y;

int do_something(){
   y = 1;
   printf("x+y=%d\n", x + y);
   printf ("\nThis is process (thread) %d.\n", getpid());	
   return 0;
}

int main ( void ) 
{
   const int STACK_SIZE = 65536;  //note stack grows down
   char *stack;
   char *stackTop;
   int cpid;

   stack = malloc(STACK_SIZE);
   if (stack == NULL) {
       perror("malloc"); exit(1);
   }
   stackTop = stack + STACK_SIZE;  /* Assume stack grows downward */

   x = 0, y = 0;
   
   cpid = clone(do_something, stackTop, CLONE_VM|CLONE_FILES, NULL);

   if(cpid == -1){
       printf ("clone failed\n");
       exit(0);
   }

   printf ("\nThis is process(thread) %d. \n", getpid());
   sleep(1);
   x = 7;
   
   printf("x+y=%d\n", x + y);
   return 0;
}
