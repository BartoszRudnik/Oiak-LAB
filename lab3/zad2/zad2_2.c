#include <stdio.h>

extern short liczba;
extern char * znak;

int main(void){

	liczba = 25;

	char tab[10] = "0123456789";	
	znak = tab;
		
	printf("%d\n", liczba);
	printf("%s\n", znak);

	return 0;

}
