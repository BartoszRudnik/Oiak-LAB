#include <stdio.h>

void pamiec();

unsigned long long start;
unsigned long long koniec;

int main(void){

	for(int i = 0; i < 50; i++){

		pamiec();
		koniec -= start;

		printf("[%d] %llu\n", i, koniec);

	}

	return 0;

}
