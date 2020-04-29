#include <stdio.h>

void rejestr();

unsigned long long start;
unsigned long long koniec;

int main(void){

	printf("Operacja zapisu do rejestru\n");

	for(int i = 0; i < 50; i++){

		rejestr();

		koniec -= start;

		printf("[%d] %llu\n", i, koniec);	


	}

	return 0;

}
