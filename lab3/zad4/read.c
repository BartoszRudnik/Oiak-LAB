#include <stdio.h>

void read();

unsigned long long start;
unsigned long long koniec;

int main(void){

	
	printf("Funkcja systemowa read\n");
	
	for(int i = 0; i < 50; i++){
		
		read();
		
		koniec -= start;
		
		printf("[%d] %llu\n", i, koniec);

	}	

	return 0;

}
