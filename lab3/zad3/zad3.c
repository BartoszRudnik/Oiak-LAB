#include <stdio.h>

unsigned long long tsc();

int main(){

	long long tab[50];

	for(int i = 0; i < 50; i++)
		tab[i] = tsc();	
	
	for(int i = 0; i < 50; i++)	
		printf("tab[%d] = %llu\n",i,tab[i]);

	return 0;

}
