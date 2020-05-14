#include <stdio.h>

short statusRegister();
void divZero();
void clearRegister();
void overflow();

int main(){

	short sR;
	
	sR = statusRegister();
	printf("Rejestr stanu przed operacja dzielenia przez zero(hex): %x\n",sR);

	divZero();

	sR = statusRegister();
	printf("Rejestr stanu po operacji dzielenia przez zero(hex): %x\n\n",sR);

	clearRegister();
	
	sR = statusRegister();
	printf("Rejestr stanu przed wywolaniem precision exception(hex): %x\n", sR);

	overflow();
	
	sR = statusRegister();
	printf("Rejestr stanu po wywolaniu precision exception(hex): %x\n", sR);

	return 0;

}
