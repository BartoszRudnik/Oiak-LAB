#include <stdio.h>

unsigned long long tsc();

int main(){

	unsigned long long tab[50];
	unsigned long long start;
	unsigned long long koniec;

	for(int i = 0; i < 50; i++){
		start = tsc();
		printf("%s", " ");
		koniec = tsc();
		tab[i] = koniec - start;

	}

	printf("\n");
	
	for(int i = 0; i < 50; i++)	
		printf("tab[%d] = %llu\n",i,tab[i]);

	return 0;

}
