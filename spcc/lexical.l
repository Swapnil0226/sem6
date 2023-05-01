%{
int line = 1;
%}

%%
int|float|if|while|for|void|long|double				            {printf("Line= %d, %s : Keyword \n ",line,yytext);}
[a-zA-Z][a-zA-Z0-9]*						                    {printf("Line= %d, %s : Identifier \n ",line,yytext);}
[0-9]+								                            {printf("Line= %d, %s : Integer \n ",line,yytext);}
[0-9]+"."[0-9]+							                        {printf("Line= %d, %s : Floating Point \n ",line,yytext);}

"+"|"-"|"/"|"*"|"="|"%"|"=="|"!"|"++"|"--"|"<"|">"|"<="|">="	{printf("Line= %d, %s : Operator \n ",line,yytext);}
"("|")"|"{"|"}"|"["|"]"|","|";"|":"				                {printf("Line= %d, %s : Punctuation \n ",line,yytext);}
[\n]								                            {line ++;}

%%

int yywrap(){}
int main()
{
FILE *fp;
char filename[50];
printf("Enter the filename : \n");
scanf("%s",filename);
fp=fopen(filename,"r");
yyin = fp;
yylex();
return 0;
}
