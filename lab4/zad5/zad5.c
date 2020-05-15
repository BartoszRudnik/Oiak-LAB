#include <stdio.h>

void zalezne();
void niezalezne();
void statusRegister();

void toBinary(short a, short tab[]){
	
	short b;
	int index;	

	while(a > 0){
	     b = a % 2;
	     a /= 2;
	     tab[index] = b;
	     index++; 	
	}		

}

unsigned long long start;
unsigned long long koniec;
short sR;
short tab[16];

int main(){

	zalezne();
	statusRegister();
	koniec -= start;
	printf("Liczba cykli dla operacji zaleznych: %llu\n", koniec);
	toBinary(sR,tab);
	printf("Rejestr statusu po wykonaniu operacji: ");
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);	
	}	
	printf("\n\n");

	for(int i = 0; i < 16; i++){
	    tab[i] = 0;
	}
	

	niezalezne();
	statusRegister();
	koniec -= start;
	printf("Liczba cykli dla operacji niezaleznych: %llu\n", koniec);
	toBinary(sR,tab);
	printf("Rejstr statusu po wykonaniu operacji: ");	
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);
	}
	printf("\n");

	return 0;

}
