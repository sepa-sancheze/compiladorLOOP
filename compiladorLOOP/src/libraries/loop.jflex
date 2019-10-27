package compiladorloop;

import java_cup.runtime.*;
import createdClasses.token;
import java.util.ArrayList;

%%

%cup
%class AnalizadorLexico
%line
%column
%{
    public ArrayList<token> tokens;
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
    /*%   TIPOS DE DATOS  */
    numerosDecimales = [1-9][0-9]*
    numerosReales = [0-9]*[.][0-9]+[1-9]
    booleano = "verdadero"|"falso"
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    /*%   REGLAS EXTRAS */
    findelinea = \n|\r|\rn
    ignorar = {findelinea}
    tabulacion = ["\ "]{4}
    variables = [a-z]+{reglas_variablesextra}
    reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
    excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {variables}
    /*%   SIGNOS  */
    finInstruccion = ";"
    parentesis1 = "("
    parentesis2 = ")"
    coma = ","
    suma = "+"
    resta = "-"
    multiplicacion = "*"
    division = "/"
    modulo = "%"
    exponenciacion = "ˆ"
    igual = "="
    incremento = "++"
    decremento = "--"
    and = "AND"
    or = "OR"
    mayorQue = ">"
    menorQue = "<"
    igualQue = "=="
    distintoQue = "!="
    dosPuntos = ":"
    corchete1 = "["
    corchete2 = "]"
    llave1 = "{"
    llave2 = "}"
    /*%   FUNCIONES ESPECIALES  */
    cadenaEntero = "cadenaAEntero"
    cadenaReal = "cadenaAReal"
    cadenaBooleano = "cadenaABoleano"
    seno = "seno"
    coseno = "coseno"
    tangente = "tangente"
    logaritmo = "logaritmo"
    raiz = "raiz"

%%

    {tabulacion}
        {   
            tokens.add(new token("TABULACION", yytext()));
            //return new Symbol(sym.TABULACION, new token("TABULACION", yytext()));             
        }

    {incluir}
        {   
            tokens.add(new token("INCLUIR", yytext()));
            //return new Symbol(sym.INCLUIR, new token("INCLUIR", yytext()));             
        }

    {extiende}
        {   
            tokens.add(new token("EXTIENDE", yytext()));
            //return new Symbol(sym.EXTIENDE, new token("EXTIENDE", yytext()));             
        }

    {hacer}
        {   
            tokens.add(new token("HACER", yytext()));
            //return new Symbol(sym.HACER, new token("HACER", yytext()));             
        }

    {decrementar}
        {   
            tokens.add(new token("DECREMENTAR", yytext()));
            //return new Symbol(sym.DECREMENTAR, new token("DECREMENTAR", yytext()));             
        }

    {incrementar}
        {   
            tokens.add(new token("INCREMENTAR", yytext()));
            //return new Symbol(sym.INCREMENTAR, new token("INCREMENTAR", yytext()));             
        }

    {mientras}
        {   
            tokens.add(new token("MIENTRAS", yytext()));
            //return new Symbol(sym.MIENTRAS, new token("MIENTRAS", yytext()));             
        }

    {desde}
        {   
            tokens.add(new token("DESDE", yytext()));
            //return new Symbol(sym.DESDE, new token("DESDE", yytext()));             
        }

    {instanciar}
        {   
            tokens.add(new token("INSTANCIAR", yytext()));
            //return new Symbol(sym.INSTANCIAR, new token("INSTANCIAR", yytext()));             
        }

    {principal}
        {   
            tokens.add(new token("PRINCIPAL", yytext()));
            //return new Symbol(sym.PRINCIPAL, new token("PRINCIPAL", yytext()));             
        }

    {destructor}
        {   
            tokens.add(new token("DESTRUCTOR", yytext()));
            //return new Symbol(sym.DESTRUCTOR, new token("DESTRUCTOR", yytext()));             
        }

    {constructor}
        {   
            tokens.add(new token("CONSTRUCTOR", yytext()));
            //return new Symbol(sym.CONSTRUCTOR, new token("CONSTRUCTOR", yytext()));             
        }

    {devolver}
        {   
            tokens.add(new token("DEVOLVER", yytext()));
            //return new Symbol(sym.DEVOLVER, new token("DEVOLVER", yytext()));             
        }

    {escribir}
        {   
            tokens.add(new token("ESCRIBIR", yytext()));
            //return new Symbol(sym.ESCRIBIR, new token("ESCRIBIR", yytext()));             
        }

    {leer}
        {   
            tokens.add(new token("LEER", yytext()));
            //return new Symbol(sym.LEER, new token("LEER", yytext()));             
        }

    {sino}
        {   
            tokens.add(new token("SINO", yytext()));
            //return new Symbol(sym.SINO, new token("SINO", yytext()));             
        }

    {entonces}
        {   
            tokens.add(new token("ENTONCES", yytext()));
            //return new Symbol(sym.ENTONCES, new token("ENTONCES", yytext()));             
        }

    {if}
        {   
            tokens.add(new token("IF", yytext()));
            //return new Symbol(sym.IF, new token("IF", yytext()));             
        }

    {clase}
        {   
            tokens.add(new token("CLASE", yytext()));
            //return new Symbol(sym.CLASE, new token("CLASE", yytext()));             
        }

    {propiedades}
        {   
            tokens.add(new token("PROPIEDADES", yytext()));
            //return new Symbol(sym.PROPIEDADES, new token("PROPIEDADES", yytext()));             
        }

    {metodos}
        {   
            tokens.add(new token("METODOS", yytext()));
            //return new Symbol(sym.METODOS, new token("METODOS", yytext()));             
        }

    {tipo_propiedades_metodos}
        {   
            tokens.add(new token("PROPIEDADES_METODOS", yytext()));
            //return new Symbol(sym.PROPIEDADES_METODOS, new token("PROPIEDADES_METODOS", yytext()));             
        }

    {tipo_datos_funciones}
        {   
            tokens.add(new token("TIPOS_DATOS_FUNCIONES", yytext()));
            //return new Symbol(sym.TIPOS_DATOS_FUNCIONES, new token("TIPOS_DATOS_FUNCIONES", yytext()));             
        }

    {tipo_datos_variables}
        {   
            tokens.add(new token("TIPOS_DATOS_VARIABLES", yytext()));
            //return new Symbol(sym.TIPOS_DATOS_VARIABLES, new token("TIPOS_DATOS_VARIABLES", yytext()));             
        }

    {booleano}
        {   
            tokens.add(new token("BOOLEANO", yytext()));
            //return new Symbol(sym.BOOLEANO, new token("BOOLEANO", yytext()));             
        }

    {numerosReales}
        {   
            tokens.add(new token("REALES", yytext()));
            //return new Symbol(sym.REALES, new token("REALES", yytext()));             
        }

    {numerosDecimales}
        {   
            tokens.add(new token("DECIMALES", yytext()));
            //return new Symbol(sym.DECIMALES, new token("DECIMALES", yytext()));             
        }

    {cadena}
        {   
            tokens.add(new token("CADENA", yytext()));
            //return new Symbol(sym.CADENA, new token("CADENA", yytext()));             
        }

    {excepciones_variables}
        {   
            tokens.add(new token("EXCEPCION_VARIABLE", yytext()));
            //return new Symbol(sym.EXCEPTION_VARIABLE, new token("EXCEPCION_VARIABLE", yytext()));             
        }

    {variables}
        {   
            tokens.add(new token("VARIABLE", yytext()));
            //return new Symbol(sym.VARIABLE, new token("VARIABLE", yytext()));             
        }

    {finInstruccion}
        {   
            tokens.add(new token("FI", yytext()));
            //return new Symbol(sym.FI, new token("FI", yytext()));             
        }

    {ignorar}     
        {
            //tokens.add(new token("ERROR", yytext()));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext()));              
        }

    .   {  
                        
        }