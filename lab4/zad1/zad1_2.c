#include <stdio.h>

short getControl();
void setControl(short c);

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

	short gC;
	short tab[16] = {0};

	gC = getControl();
	toBinary(gC,tab);
	printf("Rejestr kontroli w formacie little-endian: ");
	for(int i = 0; i < 16; i++){
	    printf("%d",tab[i]);
	}
	printf("\n");

	for(int i = 0; i < 16; i++){
	   tab[i] = 0;
	}

	setControl(127);
	
	gC = getControl();
	toBinary(gC,tab);
	printf("Rejestr kontroli w formacie little-endian: ");
	for(int i = 0; i < 16; i++){
	   printf("%d",tab[i]);	
	}	
	printf("\n");

	return 0;

}
