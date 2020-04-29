#include <stdio.h>

unsigned long long tsc();

int main(void){

	unsigned long long start;
	unsigned long long koniec;

	printf("Funkcja printf, krotki tekst ze znakiem nowej linii\n");

	for(int i = 0; i < 50; i++){
		
		start = tsc();
		printf("%s\n" ,"aaa");
		koniec = tsc();
		
		koniec -= start;	
		
		printf("[%d] %llu\n", i, koniec);

	}

	return 0;

}
