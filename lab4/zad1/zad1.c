#include <stdio.h>

short statusRegister();

int main(){

	short sR = statusRegister();
	printf("%x",sR);

	return 0;	

}
