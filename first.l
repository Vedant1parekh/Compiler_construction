%{
//Lex Program to recognize C tokens
int l=1;
int count(char str[]);
%}
operator (\+)|(\-)|(\*)|(\/)|(\^)|(\&)|(\&\&)|(\|)|(\|\|)|(=)|(==)|(\<)
ternary (.*)\?(.*):
digit [0-9]+
alphanumeric [a-zA-Z_][a-zA-Z0-9_]*
fdigit [0-9]*"."[0-9]+ 
char \'([a-zA-Z])\' 
string \".*\"
%%
"//".*                                                                  {}
"/*"(.|"\n")*"*/" 						       {l+=count(yytext);printf(" count :%d",l);}
\n    	   							l++; {printf("\n",yytext);}
"if"|"else"|"for"|"while"|"main"|"return"    {printf("Keyword");}
"int"|"float"|"char"    				       {printf("DT ",yytext);}
{digit} 						       {printf("NUM ",yytext);}
{alphanumeric} 						       {printf("IDENTIFIER ",yytext);}
{operator}			{printf("%s ",yytext);}
{string} 						       {printf("STR ",yytext);}
{fdigit}                                                       {printf("FLOAT ",yytext);}
{char}                                                         {printf("CHAR ",yytext);}
[(),;{}]                                                         {printf("%s ",yytext);}
#include.*  						       {printf("Include File",yytext);}
#define.* 					               {printf("Macro Definition",yytext);}
" "|"\t"                                                 {printf(" ");}
.							{printf("Invalid lexeme at %d",l);}
	
%%
//Driver Code to read source code and return tokens
int main() {
    yylex();
	return 0;
}
int count (char str[])
{
	int c =0;
	int i=0;
	while(str[i]!='\0')
	{
		if(str[i]=='\n')
			c++;
	i++;
	}
	return c;
}
int yywrap()
{
return 1;
}
