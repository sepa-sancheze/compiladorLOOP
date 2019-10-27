package compiladorloop;

import java_cup.runtime.*;
import createdClasses.token;
import java.util.ArrayList;

%%

%cup

%class AnalizadorLexico

%integer
%line
%column

%{
    public ArrayList<token> tokens;
    
    public boolean getEOF(){
        return this.zzAtEOF;
    }
%}

%init{
    this.tokens = new ArrayList<>();
%init}
    
    /*%  PALABRAS RESERVADAS  */
    clase = "Clase"
    propiedades = "Propiedades"
    metodos = "Metodos"
    tipo_propiedades_metodos = "Publicas"|"Publicos"|"Privadas"|"Privados"|"Protegidos"|"Protegidas"

    /*%  PALABRAS RESERVADAS TIPOS DATO Y FUNCIONES */

    tipo_datos_variables = "entero"|"cadena"|"real"|"booleano"
    tipo_datos_funciones = "entero"|"cadena"|"real"|"booleano"|"nulo"

    /*%  PALABRAS RESERVADAS DE IFS */
    if = "si"|"Si"
    entonces = "entonces"|"Entonces"
    sino = "sino"|"Sino"

    /*%  PALABRAS RESERVADAS LECTURA Y ESCRITURA */
    leer = "Leer"|"leer"
    escribir = "Escribir"|"escribir"
    /*%  PALABRAS RESERVADAS CICLO, FUNCIONES, ETC */
    devolver = "devolver"
    constructor = "Constructor"|"constructor"
    destructor = "Destructor"|"destructor"
    principal = "principal"|"Principal"
    instanciar = "instanciar"
    desde = "desde"|"Desde"
    mientras = "mientras"|"Mientras"
    incrementar = "incrementar"|"Incrementar"
    decrementar = "decrementar"|"Decrementar"
    hacer = "hacer"|"Hacer"
    extiende = "extiende"|"Extiende"
    incluir = "incluir"|"Incluir"
    
    /*%   REGLAS EXTRAS */
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

    {numeros}       
        {   
            tokens.add(new token("Número", yytext()));
            //return new Symbol(sym.NUMERO, new token("Numero",yytext()));
        }

    {mas}           
        {   
            tokens.add(new token("SignoMas", yytext()));
            //return new Symbol(sym.MAS, yytext()); 
        }

    {menos}        
        {   
            tokens.add(new token("SignoMenos", yytext()));
            //return new Symbol(sym.MENOS, yytext()); 
        }


    {excepciones_variables}       
        {

        }

    {variables}
        {   
            tokens.add(new token("Variable", yytext()));
            //return new Symbol(sym.VARIABLE, new token("VARIABLE", yytext()));             
        }

    {finInstruccion}
        {   
            tokens.add(new token("FinInstrucción", yytext()));
            //return new Symbol(sym.FI, yytext()); 
        }

    {ignorar}     
        {

        }

    .   {  
                        
        }



