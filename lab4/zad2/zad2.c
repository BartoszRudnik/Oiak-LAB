#include <stdio.h>

short statusRegister();
void divZero();
void clearRegister();
void overflow();

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

int main(){

	short sR;
	short tab[16] = {0};	

	printf("Liczby podane sa w formacie little-endian\n\n");

	sR = statusRegister();
	toBinary(sR,tab);
	printf("Rejestr stanu przed operacja dzielenia przez zero: ");
	for(int i = 0; i < 16; i++){
 	    printf("%d",tab[i]);	 
	}
	printf("\n");

	divZero();
	sR = statusRegister();
	toBinary(sR,tab);
	printf("Rejestr stanu po wywolaniu operacji dzielenia przez zero: ");	
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);	
	}
	printf("\n");
		

	clearRegister();
	for(int i = 0; i < 16; i++){
	    tab[i] = 0;
	}
	
	sR = statusRegister();
	toBinary(sR,tab);
	printf("\nRejestr stanu przed wywolaniem precision exception: ");
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);
	}

	overflow();	
	sR = statusRegister();
	toBinary(sR,tab);
	printf("\nRejstr stanu po wywolaniu precision exception: ");
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);	
	}
	printf("\n");	

	return 0;

}
