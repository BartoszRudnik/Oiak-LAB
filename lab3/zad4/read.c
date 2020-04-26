#include <stdio.h>

unsigned long long tsc();

void read();

int main(void){

	unsigned long long start;
	unsigned long long koniec;

	for(int i = 0; i < 50; i++){

		start = tsc();
		read();
		koniec = tsc();

		koniec -= start;

		printf("[%d] %llu\n", i, koniec);

	}

	return 0;

}
