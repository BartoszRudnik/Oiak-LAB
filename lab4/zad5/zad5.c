#include <stdio.h>

void zalezne();
void niezalezne();
void statusRegister();

unsigned long long start;
unsigned long long koniec;
short sR;

int main(){

	zalezne();
	statusRegister();
	koniec -= start;
	printf("Operacje zalezne: %llu\n", koniec);
	printf("Rejestr statusu(hex): %x\n\n", sR);
	
	niezalezne();
	statusRegister();
	koniec -= start;
	printf("Operacje niezalezne: %llu\n", koniec);
	printf("Rejstr statusu(hex): %x\n", sR);	

	return 0;

}
