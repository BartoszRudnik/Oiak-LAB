#include <stdio.h>

double precyzja1();
double precyzja2();

short control1;
short control2;

void toBinary(long double a){

	short tab[100] = {0};

	int index = 0;
	int pom, pom2;	
	int jeden = (int) a;
	a -= jeden;

	while(jeden > 0){

	     pom = jeden % 2;
	     jeden /= 2;

	     tab[index] = pom;
	     index++;		
	 		
	}

	for(int i = index - 1; i >= 0; i--){
	   printf("%d",tab[i]);
	}

	printf(",");

	for(int i = 0; i < 53 - index; i++){
	
	   a *= 2;
	   pom2 = (int) a;
	   a -= pom2;

	   printf("%d",pom2);
			   
		
	}

	printf("\n");

}

void toBinary1(short a){

	short tab[16] = {0};
	int index = 0;

	while(a > 0){

	     short pom = a % 2; 
	     a /= 2;
	     tab[index] = pom;
	     index++;	 
	
	}

	for(int i = 0; i < 16; i++){
	
	    printf("%d",tab[i]);	

	}

	printf("\n");

}

int main(){

	double p1,p2;

	printf("Control register(little-endian): ");
	p1 = precyzja1();
	toBinary1(control1);
	printf("Single-precision(24 bity): ");
	toBinary(p1);	

	printf("\nControl register(little-endian): ");
	p2 = precyzja2();
	toBinary1(control2);
	printf("Double-precision(53 bity): ");
	toBinary(p2);
   	
	return 0;

}
