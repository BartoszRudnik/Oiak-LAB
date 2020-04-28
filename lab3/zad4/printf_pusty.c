#include <stdio.h>

unsigned long long tsc();

int main(void){

	unsigned long long start;
	unsigned long long koniec;

	for(int i = 0; i < 50; i++){
		
		start = tsc();
		printf(" ");
		koniec = tsc();
		
		koniec -= start;

		printf("%llu\n", koniec);

	}	

	return 0;

}
