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
    public int tabulaciones;
%}
%init{
    this.tokens = new ArrayList<>();
    this.tabulaciones = 0;
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
    findelinea = \n|\r|\rn
    ignorar = \n|\r\n|\r\n|"\ "

%%

    {punto}
        {   
            tokens.add(new token("PUNTO", yytext(), this.tabulaciones));
            //return new Symbol(sym.PUNTO, new token("PUNTO", yytext(), this.tabulaciones));
        }

    {puntoYComa}
        {   
            tokens.add(new token("PUNTO_Y_COMA", yytext(), this.tabulaciones));
            //return new Symbol(sym.PUNTO_Y_COMA, new token("PUNTO_Y_COMA", yytext(), this.tabulaciones));
        }

    {tipo_booleano}
        {   
            tokens.add(new token("TIPO_BOOLEANO", yytext(), this.tabulaciones));
            //return new Symbol(sym.TIPO_BOOLEANO, new token("TIPO_BOOLEANO", yytext(), this.tabulaciones));
        }

    {tipo_cadena}
        {   
            tokens.add(new token("TIPO_CADENA", yytext(), this.tabulaciones));
            //return new Symbol(sym.TIPO_CADENA, new token("TIPO_CADENA", yytext(), this.tabulaciones));
        }

    {tipo_entero}
        {   
            tokens.add(new token("TIPO_ENTERO", yytext(), this.tabulaciones));
            //return new Symbol(sym.TIPO_ENTERO, new token("TIPO_ENTERO", yytext(), this.tabulaciones));
        }

    {tipo_real}
        {   
            tokens.add(new token("TIPO_REAL", yytext(), this.tabulaciones));
            //return new Symbol(sym.TIPO_REAL, new token("TIPO_REAL", yytext(), this.tabulaciones));
        }

    {tipo_nulo}
        {   
            tokens.add(new token("TIPO_NULO", yytext(), this.tabulaciones));
            //return new Symbol(sym.TIPO_NULO, new token("TIPO_NULO", yytext(), this.tabulaciones));
        }

    {raiz}
        {   
            tokens.add(new token("RAIZ", yytext(), this.tabulaciones));
            //return new Symbol(sym.RAIZ, new token("RAIZ", yytext(), this.tabulaciones));
        }

    {logaritmo}
        {   
            tokens.add(new token("LOGARITMO", yytext(), this.tabulaciones));
            //return new Symbol(sym.LOGARITMO, new token("LOGARITMO", yytext(), this.tabulaciones));
        }

    {tangente}
        {   
            tokens.add(new token("TANGENTE", yytext(), this.tabulaciones));
            //return new Symbol(sym.TANGENTE, new token("TANGENTE", yytext(), this.tabulaciones));
        }

    {coseno}
        {   
            tokens.add(new token("COSENO", yytext(), this.tabulaciones));
            //return new Symbol(sym.COSENO, new token("COSENO", yytext(), this.tabulaciones));
        }

    {seno}
        {   
            tokens.add(new token("SENO", yytext(), this.tabulaciones));
            //return new Symbol(sym.SENO, new token("SENO", yytext(), this.tabulaciones));
        }

    {cadenaBooleano}
        {   
            tokens.add(new token("CADENA_A_BOOLEANO", yytext(), this.tabulaciones));
            //return new Symbol(sym.CADENA_A_BOOLEANO, new token("CADENA_A_BOOLEANO", yytext(), this.tabulaciones));
        }

    {cadenaReal}
        {   
            tokens.add(new token("CADENA_A_REAL", yytext(), this.tabulaciones));
            //return new Symbol(sym.CADENA_A_REAL, new token("CADENA_A_REAL", yytext(), this.tabulaciones));
        }

    {cadenaEntero}
        {   
            tokens.add(new token("CADENA_A_ENTERO", yytext(), this.tabulaciones));
            //return new Symbol(sym.CADENA_A_ENTERO, new token("CADENA_A_ENTERO", yytext(), this.tabulaciones));
        }

    {llave2}
        {   
            tokens.add(new token("LLAVE2", yytext(), this.tabulaciones));
            //return new Symbol(sym.LLAVE2, new token("LLAVE2", yytext(), this.tabulaciones));
        }

    {llave1}
        {   
            tokens.add(new token("LLAVE1", yytext(), this.tabulaciones));
            //return new Symbol(sym.LLAVE1, new token("LLAVE1", yytext(), this.tabulaciones));
        }

    {corchete2}
        {   
            tokens.add(new token("CORCHETE2", yytext(), this.tabulaciones));
            //return new Symbol(sym.CORCHETE2, new token("CORCHETE2", yytext(), this.tabulaciones));
        }

    {corchete1}
        {   
            tokens.add(new token("CORCHETE1", yytext(), this.tabulaciones));
            //return new Symbol(sym.CORCHETE1, new token("CORCHETE1", yytext(), this.tabulaciones));
        }

    {dosPuntos}
        {   
            tokens.add(new token("DOS_PUNTOS", yytext(), this.tabulaciones));
            //return new Symbol(sym.DOS_PUNTOS, new token("DOS_PUNTOS", yytext(), this.tabulaciones));
        }

    {distintoQue}
        {   
            tokens.add(new token("DISTINTO_QUE", yytext(), this.tabulaciones));
            //return new Symbol(sym.DISTINTO_QUE, new token("DISTINTO_QUE", yytext(), this.tabulaciones));
        }

    {igualQue}
        {   
            tokens.add(new token("IGUAL_QUE", yytext(), this.tabulaciones));
            //return new Symbol(sym.IGUAL_QUE, new token("IGUAL_QUE", yytext(), this.tabulaciones));
        }

    {menorQue}
        {   
            tokens.add(new token("MENOR_QUE", yytext(), this.tabulaciones));
            //return new Symbol(sym.MENOR_QUE, new token("MENOR_QUE", yytext(), this.tabulaciones));
        }

    {mayorQue}
        {   
            tokens.add(new token("MAYOR_QUE", yytext(), this.tabulaciones));
            //return new Symbol(sym.MAYOR_QUE, new token("MAYOR_QUE", yytext(), this.tabulaciones));
        }

    {or}
        {   
            tokens.add(new token("OR", yytext(), this.tabulaciones));
            //return new Symbol(sym.OR, new token("OR", yytext(), this.tabulaciones));
        }

    {and}
        {   
            tokens.add(new token("AND", yytext(), this.tabulaciones));
            //return new Symbol(sym.AND, new token("AND", yytext(), this.tabulaciones));
        }

    {decremento}
        {   
            tokens.add(new token("DECREMENTO", yytext(), this.tabulaciones));
            //return new Symbol(sym.DECREMENTO, new token("DECREMENTO", yytext(), this.tabulaciones));
        }

    {incremento}
        {   
            tokens.add(new token("INCREMENTO", yytext(), this.tabulaciones));
            //return new Symbol(sym.INCREMENTO, new token("INCREMENTO", yytext(), this.tabulaciones));
        }

    {igual}
        {   
            tokens.add(new token("IGUAL", yytext(), this.tabulaciones));
            //return new Symbol(sym.IGUAL, new token("IGUAL", yytext(), this.tabulaciones));
        }

    {exponenciacion}
        {   
            tokens.add(new token("EXPONENCIACION", yytext(), this.tabulaciones));
            //return new Symbol(sym.EXPONENCIACION, new token("EXPONENCIACION", yytext(), this.tabulaciones));
        }

    {modulo}
        {   
            tokens.add(new token("MODULO", yytext(), this.tabulaciones));
            //return new Symbol(sym.MODULO, new token("MODULO", yytext(), this.tabulaciones));
        }

    {division}
        {   
            tokens.add(new token("DIVISION", yytext(), this.tabulaciones));
            //return new Symbol(sym.DIVISION, new token("DIVISION", yytext(), this.tabulaciones));
        }

    {multiplicacion}
        {   
            tokens.add(new token("MULTIPLICACION", yytext(), this.tabulaciones));
            //return new Symbol(sym.MULTIPLICACION, new token("MULTIPLICACION", yytext(), this.tabulaciones));
        }

    {resta}
        {   
            tokens.add(new token("RESTA", yytext(), this.tabulaciones));
            //return new Symbol(sym.RESTA, new token("RESTA", yytext(), this.tabulaciones));
        }

    {suma}
        {   
            tokens.add(new token("SUMA", yytext(), this.tabulaciones));
            //return new Symbol(sym.SUMA, new token("SUMA", yytext(), this.tabulaciones));
        }

    {coma}
        {   
            tokens.add(new token("COMA", yytext(), this.tabulaciones));
            //return new Symbol(sym.COMA, new token("COMA", yytext(), this.tabulaciones));
        }

    {parentesis2}
        {   
            tokens.add(new token("PARENTESIS2", yytext(), this.tabulaciones));
            //return new Symbol(sym.PARENTESIS2, new token("PARENTESIS2", yytext(), this.tabulaciones));
        }

    {parentesis1}
        {   
            tokens.add(new token("PARENTESIS1", yytext(), this.tabulaciones));
            //return new Symbol(sym.PARENTESIS1, new token("PARENTESIS1", yytext(), this.tabulaciones));
        }

    {tabulacion}
        {   
            this.tabulaciones++;
            //tokens.add(new token("TABULACION", yytext(), tabs));
            //return new Symbol(sym.TABULACION, new token("TABULACION", yytext(), tabs));
        }

    {incluir}
        {   
            tokens.add(new token("INCLUIR", yytext(), this.tabulaciones));
            //return new Symbol(sym.INCLUIR, new token("INCLUIR", yytext(), this.tabulaciones));
        }
    {eliminar}
        {   
            tokens.add(new token("ELIMINAR", yytext(), this.tabulaciones));
            //return new Symbol(sym.DECREMENTAR, new token("DECREMENTAR", yytext(), this.tabulaciones));
        }

    {extiende}
        {   
            tokens.add(new token("EXTIENDE", yytext(), this.tabulaciones));
            //return new Symbol(sym.EXTIENDE, new token("EXTIENDE", yytext(), this.tabulaciones));
        }

    {hacer}
        {   
            tokens.add(new token("HACER", yytext(), this.tabulaciones));
            //return new Symbol(sym.HACER, new token("HACER", yytext(), this.tabulaciones));
        }

    {decrementar}
        {   
            tokens.add(new token("DECREMENTAR", yytext(), this.tabulaciones));
            //return new Symbol(sym.DECREMENTAR, new token("DECREMENTAR", yytext(), this.tabulaciones));
        }

    {incrementar}
        {   
            tokens.add(new token("INCREMENTAR", yytext(), this.tabulaciones));
            //return new Symbol(sym.INCREMENTAR, new token("INCREMENTAR", yytext(), this.tabulaciones));
        }

    {mientras}
        {   
            tokens.add(new token("MIENTRAS", yytext(), this.tabulaciones));
            //return new Symbol(sym.MIENTRAS, new token("MIENTRAS", yytext(), this.tabulaciones));
        }

    {desde}
        {   
            tokens.add(new token("DESDE", yytext(), this.tabulaciones));
            //return new Symbol(sym.DESDE, new token("DESDE", yytext(), this.tabulaciones));
        }

    {instanciar}
        {   
            tokens.add(new token("INSTANCIAR", yytext(), this.tabulaciones));
            //return new Symbol(sym.INSTANCIAR, new token("INSTANCIAR", yytext(), this.tabulaciones));
        }

    {principal}
        {   
            tokens.add(new token("PRINCIPAL", yytext(), this.tabulaciones));
            //return new Symbol(sym.PRINCIPAL, new token("PRINCIPAL", yytext(), this.tabulaciones));
        }

    {destructor}
        {   
            tokens.add(new token("DESTRUCTOR", yytext(), this.tabulaciones));
            //return new Symbol(sym.DESTRUCTOR, new token("DESTRUCTOR", yytext(), this.tabulaciones));
        }

    {constructor}
        {   
            tokens.add(new token("CONSTRUCTOR", yytext(), this.tabulaciones));
            //return new Symbol(sym.CONSTRUCTOR, new token("CONSTRUCTOR", yytext(), this.tabulaciones));
        }

    {devolver}
        {   
            tokens.add(new token("DEVOLVER", yytext(), this.tabulaciones));
            //return new Symbol(sym.DEVOLVER, new token("DEVOLVER", yytext(), this.tabulaciones));
        }

    {escribir}
        {   
            tokens.add(new token("ESCRIBIR", yytext(), this.tabulaciones));
            //return new Symbol(sym.ESCRIBIR, new token("ESCRIBIR", yytext(), this.tabulaciones));
        }

    {leer}
        {   
            tokens.add(new token("LEER", yytext(), this.tabulaciones));
            //return new Symbol(sym.LEER, new token("LEER", yytext(), this.tabulaciones));
        }

    {sino}
        {   
            tokens.add(new token("SINO", yytext(), this.tabulaciones));
            //return new Symbol(sym.SINO, new token("SINO", yytext(), this.tabulaciones));
        }

    {entonces}
        {   
            tokens.add(new token("ENTONCES", yytext(), this.tabulaciones));
            //return new Symbol(sym.ENTONCES, new token("ENTONCES", yytext(), this.tabulaciones));
        }

    {if}
        {   
            tokens.add(new token("IF", yytext(), this.tabulaciones));
            //return new Symbol(sym.IF, new token("IF", yytext(), this.tabulaciones));
        }

    {clase}
        {   
            tokens.add(new token("CLASE", yytext(), this.tabulaciones));
            //return new Symbol(sym.CLASE, new token("CLASE", yytext(), this.tabulaciones));
        }

    {propiedades}
        {   
            tokens.add(new token("PROPIEDADES", yytext(), this.tabulaciones));
            //return new Symbol(sym.PROPIEDADES, new token("PROPIEDADES", yytext(), this.tabulaciones));
        }

    {metodos}
        {   
            tokens.add(new token("METODOS", yytext(), this.tabulaciones));
            //return new Symbol(sym.METODOS, new token("METODOS", yytext(), this.tabulaciones));
        }

    {tipo_propiedades_metodos}
        {   
            tokens.add(new token("PROPIEDADES_METODOS", yytext(), this.tabulaciones));
            //return new Symbol(sym.PROPIEDADES_METODOS, new token("PROPIEDADES_METODOS", yytext(), this.tabulaciones));
        }

    {booleano}
        {   
            tokens.add(new token("BOOLEANO", yytext(), this.tabulaciones));
            //return new Symbol(sym.BOOLEANO, new token("BOOLEANO", yytext(), this.tabulaciones));
        }

    {numerosReales}
        {   
            tokens.add(new token("REALES", yytext(), this.tabulaciones));
            //return new Symbol(sym.REALES, new token("REALES", yytext(), this.tabulaciones));
        }

    {numerosDecimales}
        {   
            tokens.add(new token("DECIMALES", yytext(), this.tabulaciones));
            //return new Symbol(sym.DECIMALES, new token("DECIMALES", yytext(), this.tabulaciones));
        }

    {cadena}
        {   
            tokens.add(new token("CADENA", yytext(), this.tabulaciones));
            //return new Symbol(sym.CADENA, new token("CADENA", yytext(), this.tabulaciones));
        }

    {excepciones_variables_clase}
        {   
            tokens.add(new token("ERROR", yytext(), this.tabulaciones));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext(), this.tabulaciones));
        }

    {variables_clase}
        {   
            tokens.add(new token("VARIABLE_CLASE", yytext(), this.tabulaciones));
            //return new Symbol(sym.VARIABLE_CLASE, new token("VARIABLE_CLASE", yytext(), this.tabulaciones));
        }

    {excepciones_variables}
        {   
            //tokens.add(new token("ERROR", yytext(), this.tabulaciones));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext(), this.tabulaciones));
        }

    {variables}
        {   
            tokens.add(new token("VARIABLE", yytext(), this.tabulaciones));
            //return new Symbol(sym.VARIABLE, new token("VARIABLE", yytext(), this.tabulaciones));
        }

    {finInstruccion}
        {   
            tokens.add(new token("FI", yytext(), this.tabulaciones));
            //return new Symbol(sym.FI, new token("FI", yytext(), this.tabulaciones));
        }

    {findelinea}     
        {
            this.tabulaciones = 0;
        }

    {ignorar}     
        {
            //this.tabulaciones = 0;
        }

    .   {  
            tokens.add(new token("ERROR", yytext(), this.tabulaciones));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext(), this.tabulaciones));
        }