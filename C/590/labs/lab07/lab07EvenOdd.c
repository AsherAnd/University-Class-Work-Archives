// Asher Andargachew
// CPS 590
// 501101885

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

pthread_mutex_t count_mutex     = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t  condition_var   = PTHREAD_COND_INITIALIZER;

void *functionEven();
void *functionOdd();
int total = 0;
int count = 0;
#define COUNT_DONE 9


int main()
{
	printf("Starting total: %d\n",total);

	pthread_t thread1, thread2;

	pthread_create( &thread1, NULL, &functionEven, NULL);
	pthread_create( &thread2, NULL, &functionOdd, NULL);

	pthread_join( thread1, NULL);
   	pthread_join( thread2, NULL);

   	printf("Final total: %d\n",total);

   	exit(0);
}

void *functionEven()
{
	for(;;)
	{	
		pthread_mutex_lock( &count_mutex );

		pthread_cond_wait( &condition_var, &count_mutex );
		count++;
		total = total + 2;
		printf("Total value functionEven: %d\n",total);

		pthread_mutex_unlock( &count_mutex );

      		if(count >= COUNT_DONE) return(NULL);

	}
}

void *functionOdd()
{
	for(;;)
	{
		pthread_mutex_lock( &count_mutex );
		
		if (count % 2 == 0)
		{
			pthread_cond_signal( &condition_var );
		}
		else
		{
			count++;
			total++;
			printf("Total value functionOdd:  %d\n",total);
		}

		pthread_mutex_unlock( &count_mutex );
		
       		if(count >= COUNT_DONE) return(NULL);
	}
}