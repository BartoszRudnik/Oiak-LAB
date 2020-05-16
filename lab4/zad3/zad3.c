#include <stdio.h>

double bez();
double tryb1();
double tryb2();
double tryb3();

short control1;
short control2;
short control3;

void toBinary(double a){

	short tab[1000] = {0};

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

	for(int i = 0; i < 23 - index; i++){
	
	   a *= 2;
	   pom2 = (int) a;
	   a -= pom2;

	   printf("%d",pom2);
	  		
	}

}

void toBinary1(double a){

	short tab[1000] = {0};

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

	for(int i = 0; i < 26 - index; i++){
	
	   a *= 2;
	   pom2 = (int) a;
	   a -= pom2;

	   printf("%d",pom2);

	   if(i == 22 - index){
	     printf(" ");	
	   }
	  		
	}

}

void toBinary2(short a){

	short tab[16] = {0};
	short pom;
        int index = 0;
	
	while(a > 0){
	
	     pom = a % 2;
	     a /= 2;
             tab[index] = pom;
	     index++;

	}

	for(int i = 0; i < 16; i++){

	    printf("%d",tab[i]);

	}

}


int main(){

	double t1,t2,t3,b;

	printf("Wynik dzialania bez zaokraglania: ");
	b = bez();
	toBinary1(b);
	printf("\n\n");
		
	printf("Zaokraglanie 'round to nearest':  ");
	t1 = tryb1();
	toBinary(t1);
	printf("\nRejestr konroli(little-endian): ");
	toBinary2(control1);
	printf("\n\n");

	printf("Zaokraglanie 'round up':          ");
	t2 = tryb2();
	toBinary(t2);
	printf("\nRejestr kontroli(little-endian): ");
	toBinary2(control2);
	printf("\n\n");

	printf("Zaokraglanie 'round down':        ");
	t3 = tryb3();
	toBinary(t3);
	printf("\nRejestr kontroli(little-endian): ");
	toBinary2(control3);
	printf("\n\n");	

	return 0;

}
