#include <stdio.h>

void rejestr();

unsigned long long start;
unsigned long long koniec;

int main(void){

	for(int i = 0; i < 50; i++){

		rejestr();

		koniec -= start;

		printf("[%d] %llu\n", i, koniec);	


	}

	return 0;

}
