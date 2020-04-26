#include <stdio.h>

char znak;
char tablica[10];

void funkcja();
void funkcja1();

int main(void){

	funkcja();
	funkcja1();

	printf("Znak: %c\n", znak);
	
	for(int i = 0; i < 10; i++){
		printf("Tablica[%d] = %c\n", i,tablica[i]);
	}

	return 0;

}
