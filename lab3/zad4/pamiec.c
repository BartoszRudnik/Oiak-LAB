#include <stdio.h>

void pamiec();

unsigned long long start;
unsigned long long koniec;

int main(void){

	printf("Operacja zapisu do pamieci\n");

	for(int i = 0; i < 50; i++){

		pamiec();
		koniec -= start;

		printf("[%d] %llu\n", i, koniec);

	}

	return 0;

}
