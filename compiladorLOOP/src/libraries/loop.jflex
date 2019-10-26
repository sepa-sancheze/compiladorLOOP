package compiladorloop;

import java_cup.runtime.*;
import createdClasses.token;

%%

%cup
%class AnalizadorLexico

%line
%column


numeros = [0-9]+
findelinea = \n|\r|\rn
ignorar = {findelinea} | [\t\f]
mas = "+"
menos = "-"
finInstruccion = ";"
variables = [a-z]+{reglas_variablesextra}
reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {variables}
%%

{numeros}       { return new Symbol(sym.NUMERO, new token("Numero",yytext()));}

{mas}           { return new Symbol(sym.MAS, yytext()); }

{menos}         { return new Symbol(sym.MENOS, yytext()); }


{excepciones_variables}       {}

{variables}
                {System.out.println("Encontre una variable Lexema: " + yytext());
                 return new Symbol(sym.VARIABLE, new token("VARIABLE", yytext()));
                 
                 }

{finInstruccion}
                { return new Symbol(sym.FI, yytext()); }

{ignorar}       {

                }

.               {  
                    
                }



