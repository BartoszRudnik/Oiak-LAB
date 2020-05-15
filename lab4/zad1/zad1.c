#include <stdio.h>

short statusRegister();

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
	
	short tab[16] = {0};
	short sR;

	sR = statusRegister();
	toBinary(sR,tab);
	printf("Rejestr statusu w formacie little-endian: ");
	for(int i = 0; i < 16; i++){
	   printf("%d",tab[i]);
	}
	printf("\n");

	return 0;	

}
