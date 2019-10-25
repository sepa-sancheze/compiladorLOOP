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

%%

{numeros}       { return new Symbol(sym.NUMERO, new token("Numero",yytext())); }

{mas}           { return new Symbol(sym.MAS, yytext()); }

{menos}         { return new Symbol(sym.MENOS, yytext()); }

{finInstruccion}
                { return new Symbol(sym.FI, yytext()); }
{ignorar}       {

                }

.               {  
                    
                }
