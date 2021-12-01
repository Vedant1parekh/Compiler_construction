%{

#include <stdio.h>
int flag=0;//here intially flag value is 0

%}

%token NUM

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

%%
ArithmeticExpression: E{
	printf("\nResult=%d\n",$$);

	return 0;
};

E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUM {$$=$1;}

 ;
%%

void main()
{
	printf("\nEnter any Arithmetic Expression: ");
	yyparse();
	if(flag==0)
	{
		printf("\nEntered Arithmetic Expression is Valid");
	}
}

void yyerror()//function to handle error
{
	printf("\nEntered Arithmetic Expression is Invalid");
	flag=1;
}
