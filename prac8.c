//To implement type checking
#include<stdio.h>
#include<stdlib.h>
int main()
{
    int n,i,k,f=0;
    char var[15],typ[15],b[15],c;
    printf("Enter the number of variables:");
    scanf(" %d",&n);
    for(i=0;i<n;i++)
    {
        printf("Enter the variable %d:",i);
        scanf(" %c",&var[i]);
        printf("Enter the variable-type %d (float-f,int-i):",i);
        scanf(" %c",&typ[i]);
        if(typ[i]=='f')
        f=1;// if tup[i]==f then flag=1
    }
    printf("Enter the Expression(end with $):");
    i=0;
    getchar();
    while((c=getchar())!='$')
    {
        b[i]=c;
        i++;  
    }
    k=i;
    for(i=0;i<k;i++)
    {
        if(b[i]=='/')
        {
            f=1;
            break;
        }  
    }
    for(i=0;i<n;i++)
    {
        if(b[0]==var[i])
        {
            if(f==1)
            {
                if(typ[i]=='f')
                {  
                    printf("\nthe datatype is correctly defined..!\n");
                    break;  
                }
                else
                {  
                    printf("Identifier %c must be a float type..!\n",var[i]);
                    break;  
                }  
            }
            else
            {  
                printf("\nthe datatype is correctly defined..!\n");
                break;  
            } 
        }
    }
    return 0;
}
