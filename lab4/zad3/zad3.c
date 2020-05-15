#include <stdio.h>

double tryb1();
double tryb2();
double tryb3();

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

	for(int i = 0; i < 26; i++){
	
	   a *= 2;
	   pom2 = (int) a;
	   a -= pom2;

	   printf("%d",pom2);

	   if(i == 22){
	      printf(" ");	
	   }
		
	}

}

int main(){

	double t1,t2,t3;
		
	printf("Zaokraglanie 'round to nearest': ");
	t1 = tryb1();
	toBinary(t1);
	printf("\n");

	printf("Zaokraglanie 'round up':         ");
	t2 = tryb2();
	toBinary(t2);
	printf("\n");

	printf("Zaokraglanie 'round down':       ");
	t3 = tryb3();
	toBinary(t3);
	printf("\n");	

	return 0;

}
