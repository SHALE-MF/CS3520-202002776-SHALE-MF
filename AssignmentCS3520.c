/*Program to find and display the first 10 reversible prime squares
MF Shale 
202002776
*/

#include <stdio.h>
#include <conio.h>
#include <stdbool.h>
#include<math.h>

//functions 

int reversenum(int num)
{
	int a, reversenum=0;
	while(num!=0)
	{
		num=a%10;
		reversenum=reversenum*10+num;
		a=a/10;
	}
	return reversenum;
}
//for the number to be prime number it must only be divisble by 1 and itself
bool primenumcheck(int num)
{
	int b;
	bool Primenum=true;
	
	if(num==0 || num==1)
	{
		Primenum=false;
	}
	
	for(b=2;b<=(num)/2;b++)
	if(num%b==0)
	{
		Primenum=false;
		break;
	}
	return Primenum;
}
//it is a palindrome if reversed number is the same as the original number 
bool not_a_palidrome(int num)
{
	bool itsApalindrome=true;
	if(reversenum(num)==num)
	{
		itsApalindrome = false;
	}
	return itsApalindrome;
}

bool isPerfect(long num)
{
	int b;
    for(b=1; b * b <= (num)/2; b++ )
    {
        if((num % b == 0) && (num / b == b))
        {
            return true;
        }
    }
    return false;
}

int main ()
{
	
	int c=0;
	int w,x,y,z;

	for(w=0;w>=0;w++)
	{
		
		int y = reverse(w);

        if(isPerfect(w) == true && isPerfect(y) == true)
        {
            x = sqrt(w);
            z = sqrt(y);

            if(primechecker2(x) == 1 && primechecker2(z))
            {
                if(not_palindrome(w))
                {
                    printf("%d \n",w);
                    c++;
                    if(c==10)
                    {
                    	break;
					}
                }

            }
        }
			
	}

	
	return 0;
	
}



