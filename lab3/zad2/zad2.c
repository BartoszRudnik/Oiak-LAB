#include <stdio.h>

char znak;
char tablica[10];

void funkcja();
void funkcja1();

int main(void){

	funkcja();
	funkcja1();

	printf("Znak: %c\n", znak);
	
	printf("Tablica: %s\n", tablica);

	return 0;

}
