#include <stdio.h>

void write();

unsigned long long start;
unsigned long long koniec;

int main(void){

	for(int i = 0; i < 50; i++){

		write();
		koniec -= start;

		printf(" [%d] = %llu\n", i, koniec);

	}

	return 0;

}
