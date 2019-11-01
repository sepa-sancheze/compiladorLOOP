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
    tipo_entero = "entero"
    tipo_cadena = "cadena"
    tipo_real = "real"
    tipo_booleano = "booleano"
    tipo_nulo = "nulo"
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
    eliminar ="Eliminar"|"eliminar"
    incluir = "incluir"|"Incluir"
    /*%   TIPOS DE DATOS  */
    numerosDecimales = [1-9][0-9]* | 0
    numerosReales = [0-9]*[.][0-9]+[1-9]
    booleano = "verdadero"|"falso"
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    /*%   REGLAS EXTRAS */
    findelinea = \n|\r|\rn
    tabulacion = ["\ "]{4}
    variables = [a-z]+{reglas_variablesextra}
    reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
    excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {variables}
    variables_clase = [A-Z]+{reglas_variablesextra}
    excepciones_variables_clase = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"
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
    puntoYComa = ";"
    punto = "."
    /*%   FUNCIONES ESPECIALES  */
    cadenaEntero = "cadenaAEntero"
    cadenaReal = "cadenaAReal"
    cadenaBooleano = "cadenaABoleano"
    seno = "seno"
    coseno = "coseno"
    tangente = "tangente"
    logaritmo = "logaritmo"
    raiz = "raiz"
    /*%   IGNORAR  */
    ignorar = \n|\r\n|\r\n|\t\|{findelinea}|"\ "

%%

    {punto}
        {   
            tokens.add(new token("PUNTO", yytext()));
            //return new Symbol(sym.PUNTO, new token("PUNTO", yytext()));             
        }

    {puntoYComa}
        {   
            tokens.add(new token("PUNTO_Y_COMA", yytext()));
            //return new Symbol(sym.PUNTO_Y_COMA, new token("PUNTO_Y_COMA", yytext()));             
        }

    {tipo_booleano}
        {   
            tokens.add(new token("TIPO_BOOLEANO", yytext()));
            //return new Symbol(sym.TIPO_BOOLEANO, new token("TIPO_BOOLEANO", yytext()));             
        }

    {tipo_cadena}
        {   
            tokens.add(new token("TIPO_CADENA", yytext()));
            //return new Symbol(sym.TIPO_CADENA, new token("TIPO_CADENA", yytext()));             
        }

    {tipo_entero}
        {   
            tokens.add(new token("TIPO_ENTERO", yytext()));
            //return new Symbol(sym.TIPO_ENTERO, new token("TIPO_ENTERO", yytext()));             
        }

    {tipo_real}
        {   
            tokens.add(new token("TIPO_REAL", yytext()));
            //return new Symbol(sym.TIPO_REAL, new token("TIPO_REAL", yytext()));             
        }

    {tipo_nulo}
        {   
            tokens.add(new token("TIPO_NULO", yytext()));
            //return new Symbol(sym.TIPO_NULO, new token("TIPO_NULO", yytext()));             
        }

    {raiz}
        {   
            tokens.add(new token("RAIZ", yytext()));
            //return new Symbol(sym.RAIZ, new token("RAIZ", yytext()));             
        }

    {logaritmo}
        {   
            tokens.add(new token("LOGARITMO", yytext()));
            //return new Symbol(sym.LOGARITMO, new token("LOGARITMO", yytext()));             
        }

    {tangente}
        {   
            tokens.add(new token("TANGENTE", yytext()));
            //return new Symbol(sym.TANGENTE, new token("TANGENTE", yytext()));             
        }

    {coseno}
        {   
            tokens.add(new token("COSENO", yytext()));
            //return new Symbol(sym.COSENO, new token("COSENO", yytext()));             
        }

    {seno}
        {   
            tokens.add(new token("SENO", yytext()));
            //return new Symbol(sym.SENO, new token("SENO", yytext()));             
        }

    {cadenaBooleano}
        {   
            tokens.add(new token("CADENA_A_BOOLEANO", yytext()));
            //return new Symbol(sym.CADENA_A_BOOLEANO, new token("CADENA_A_BOOLEANO", yytext()));             
        }

    {cadenaReal}
        {   
            tokens.add(new token("CADENA_A_REAL", yytext()));
            //return new Symbol(sym.CADENA_A_REAL, new token("CADENA_A_REAL", yytext()));             
        }

    {cadenaEntero}
        {   
            tokens.add(new token("CADENA_A_ENTERO", yytext()));
            //return new Symbol(sym.CADENA_A_ENTERO, new token("CADENA_A_ENTERO", yytext()));             
        }

    {llave2}
        {   
            tokens.add(new token("LLAVE2", yytext()));
            //return new Symbol(sym.LLAVE2, new token("LLAVE2", yytext()));             
        }

    {llave1}
        {   
            tokens.add(new token("LLAVE1", yytext()));
            //return new Symbol(sym.LLAVE1, new token("LLAVE1", yytext()));             
        }

    {corchete2}
        {   
            tokens.add(new token("CORCHETE2", yytext()));
            //return new Symbol(sym.CORCHETE2, new token("CORCHETE2", yytext()));             
        }

    {corchete1}
        {   
            tokens.add(new token("CORCHETE1", yytext()));
            //return new Symbol(sym.CORCHETE1, new token("CORCHETE1", yytext()));             
        }

    {dosPuntos}
        {   
            tokens.add(new token("DOS_PUNTOS", yytext()));
            //return new Symbol(sym.DOS_PUNTOS, new token("DOS_PUNTOS", yytext()));             
        }

    {distintoQue}
        {   
            tokens.add(new token("DISTINTO_QUE", yytext()));
            //return new Symbol(sym.DISTINTO_QUE, new token("DISTINTO_QUE", yytext()));             
        }

    {igualQue}
        {   
            tokens.add(new token("IGUAL_QUE", yytext()));
            //return new Symbol(sym.IGUAL_QUE, new token("IGUAL_QUE", yytext()));             
        }

    {menorQue}
        {   
            tokens.add(new token("MENOR_QUE", yytext()));
            //return new Symbol(sym.MENOR_QUE, new token("MENOR_QUE", yytext()));             
        }

    {mayorQue}
        {   
            tokens.add(new token("MAYOR_QUE", yytext()));
            //return new Symbol(sym.MAYOR_QUE, new token("MAYOR_QUE", yytext()));             
        }

    {or}
        {   
            tokens.add(new token("OR", yytext()));
            //return new Symbol(sym.OR, new token("OR", yytext()));             
        }

    {and}
        {   
            tokens.add(new token("AND", yytext()));
            //return new Symbol(sym.AND, new token("AND", yytext()));             
        }

    {decremento}
        {   
            tokens.add(new token("DECREMENTO", yytext()));
            //return new Symbol(sym.DECREMENTO, new token("DECREMENTO", yytext()));             
        }

    {incremento}
        {   
            tokens.add(new token("INCREMENTO", yytext()));
            //return new Symbol(sym.INCREMENTO, new token("INCREMENTO", yytext()));             
        }

    {igual}
        {   
            tokens.add(new token("IGUAL", yytext()));
            //return new Symbol(sym.IGUAL, new token("IGUAL", yytext()));             
        }

    {exponenciacion}
        {   
            tokens.add(new token("EXPONENCIACION", yytext()));
            //return new Symbol(sym.EXPONENCIACION, new token("EXPONENCIACION", yytext()));             
        }

    {modulo}
        {   
            tokens.add(new token("MODULO", yytext()));
            //return new Symbol(sym.MODULO, new token("MODULO", yytext()));             
        }

    {division}
        {   
            tokens.add(new token("DIVISION", yytext()));
            //return new Symbol(sym.DIVISION, new token("DIVISION", yytext()));             
        }

    {multiplicacion}
        {   
            tokens.add(new token("MULTIPLICACION", yytext()));
            //return new Symbol(sym.MULTIPLICACION, new token("MULTIPLICACION", yytext()));             
        }

    {resta}
        {   
            tokens.add(new token("RESTA", yytext()));
            //return new Symbol(sym.RESTA, new token("RESTA", yytext()));             
        }

    {suma}
        {   
            tokens.add(new token("SUMA", yytext()));
            //return new Symbol(sym.SUMA, new token("SUMA", yytext()));             
        }

    {coma}
        {   
            tokens.add(new token("COMA", yytext()));
            //return new Symbol(sym.COMA, new token("COMA", yytext()));             
        }

    {parentesis2}
        {   
            tokens.add(new token("PARENTESIS2", yytext()));
            //return new Symbol(sym.PARENTESIS2, new token("PARENTESIS2", yytext()));             
        }

    {parentesis1}
        {   
            tokens.add(new token("PARENTESIS1", yytext()));
            //return new Symbol(sym.PARENTESIS1, new token("PARENTESIS1", yytext()));             
        }

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
    {eliminar}
        {   
            tokens.add(new token("ELIMINAR", yytext()));
            //return new Symbol(sym.DECREMENTAR, new token("DECREMENTAR", yytext()));             
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

    {excepciones_variables_clase}
        {   
            tokens.add(new token("ERROR", yytext()));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext()));             
        }

    {variables_clase}
        {   
            tokens.add(new token("VARIABLE_CLASE", yytext()));
            //return new Symbol(sym.VARIABLE_CLASE, new token("VARIABLE_CLASE", yytext()));             
        }

    {excepciones_variables}
        {   
            //tokens.add(new token("ERROR", yytext()));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext()));             
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
            
        }

    .   {  
            tokens.add(new token("ERROR", yytext()));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext()));
        }