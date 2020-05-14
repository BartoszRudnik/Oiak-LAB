#include <stdio.h>

short getControl();
void setControl(short c);

int main(){

	short gC;

	gC = getControl();
	printf("%x\n",gC);

	setControl(127);
	
	gC = getControl();
	printf("%x\n", gC);	

	return 0;

}
