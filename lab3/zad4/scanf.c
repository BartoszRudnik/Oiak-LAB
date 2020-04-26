#include <stdio.h>

unsigned long long tsc();

int main(void){

	unsigned long long start;
	unsigned long long koniec;

	char znak;

	for(int i = 0; i < 50; i++){

		start = tsc();

		if(scanf(" %c", &znak) == 1){

		  koniec = tsc();
		  koniec -= start;
		  printf("[%d] %llu\n", i, koniec);

		}

	}

	return 0;

}

