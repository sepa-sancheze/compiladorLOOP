/* primera parte: no hace falta poner nada */
package sumadoraarbol;
import java_cup.runtime.Symbol;
import java.util.ArrayList;
%%

/* segunda parte: declaramos las directivas y los macros */
%class AnalizadorLexico
%line
%char
%column
%cup
%eofval{
  System.out.println("Fin de archivo encontrado");
  return new Symbol(sym.EOF);
%eofval}
%{
    public ArrayList<token> tokens;
    public int tabulaciones;
public ArrayList<Simbolos> sim;

public void add(String nuevo) {

        boolean bandera = false;
        String a = nuevo;
       
        int numero = 0;
        if (sim.size() == 0) {
            Simbolos sim2 = new Simbolos();
            sim2.setCantidad(1);
            sim2.setValor(a);
            sim.add(sim2);
        } else {
            for (int x = 0; x < sim.size(); x++) {

                Simbolos sim1 = sim.get(x);

                if (sim1.getValor().equals(a)) {
                    bandera = true;
                    numero = x;

                    x = sim.size();
                } else {
                    bandera = false;
                }
            }
            if (bandera == true) {
                
                Simbolos val = sim.get(numero);
                int n = val.getCantidad();
                n = n + 1;
                val.setCantidad(n);
                sim.remove(numero);
                sim.add(val);
                   
            } else {
              
                Simbolos sim2 = new Simbolos();
                sim2.setCantidad(1);
                sim2.setValor(a);
                sim.add(sim2);
            }
        }
           
    }



%}
%init{
    this.tokens = new ArrayList<>();
    this.sim = new ArrayList<>();
    this.tabulaciones = 0;
%init}
%eofclose
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
    nuevo = "nuevo"
    /*%   TIPOS DE DATOS  */
    numerosDecimales = [1-9][0-9]* | 0
    numerosReales = [0-9]*[.][0-9]+[1-9]
    booleano = "verdadero"|"falso"
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    comentarios = [\/\/]([a-zA-Z]*[0-9]*["\ "]*)*
    /*%   REGLAS EXTRAS */
    tabulacion = ["\ "]{4}|\t
    variables = [a-z]+{reglas_variablesextra}
    reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
    excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {variables}
    variables_clase = [A-Z]+{reglas_variablesextra}
    excepciones_variables_clase = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"
    /*%   SIGNOS  */
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
            //tokens.add(new token("PUNTO", yytext(), this.tabulaciones, yyline, yycolumn));
             this.add("PUNTO");
            return new Symbol(sym.PUNTO, new token("PUNTO", yytext(), this.tabulaciones, yyline, yycolumn));
            
        }

    {comentarios}
        {   
            //tokens.add(new token("PUNTO", yytext(), this.tabulaciones, yyline, yycolumn));
            //this.add("PUNTO");
            //return new Symbol(sym.PUNTO, new token("PUNTO", yytext(), this.tabulaciones, yyline, yycolumn));
            
        }

    {nuevo}
        {   
            //tokens.add(new token("NUEVO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("NUEVO");
            return new Symbol(sym.NUEVO, new token("NUEVO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_booleano}
        {   
            //tokens.add(new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO BOOLEANO");
            return new Symbol(sym.PALABRA_RESERVADA_TIPO, new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_cadena}
        {   
            //tokens.add(new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO CADENA");
            return new Symbol(sym.PALABRA_RESERVADA_TIPO, new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_entero}
        {   
            //tokens.add(new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO ENTERO");
            return new Symbol(sym.PALABRA_RESERVADA_TIPO, new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_real}
        {   
            //tokens.add(new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO REAL");
            return new Symbol(sym.PALABRA_RESERVADA_TIPO, new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_nulo}
        {   
            ////tokens.add(new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
            //return new Symbol(sym.PALABRA_RESERVADA_TIPO, new token("PALABRA_RESERVADA_TIPO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {raiz}
        {   
            //tokens.add(new token("RAIZ", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("RAIZ");
            return new Symbol(sym.RAIZ, new token("RAIZ", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {logaritmo}
        {   
            //tokens.add(new token("LOGARITMO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("LOGARITMO");
            return new Symbol(sym.LOGARITMO, new token("LOGARITMO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tangente}
        {   
            //tokens.add(new token("TANGENTE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TANGENTE");
            return new Symbol(sym.TANGENTE, new token("TANGENTE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {coseno}
        {   
            //tokens.add(new token("COSENO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("COSENO");
            return new Symbol(sym.COSENO, new token("COSENO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {seno}
        {   
            //tokens.add(new token("SENO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("SENO");
            return new Symbol(sym.SENO, new token("SENO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {cadenaBooleano}
        {   
            //tokens.add(new token("CADENA_A_BOOLEANO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("CADENAABOOLEANO");
            return new Symbol(sym.CADENA_A_BOOLEANO, new token("CADENA_A_BOOLEANO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {cadenaReal}
        {   
            //tokens.add(new token("CADENA_A_REAL", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("CADENAAREAL");
            return new Symbol(sym.CADENA_A_REAL, new token("CADENA_A_REAL", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {cadenaEntero}
        {   
            //tokens.add(new token("CADENA_A_ENTERO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("CADENAAENTERO");
            return new Symbol(sym.CADENA_A_ENTERO, new token("CADENA_A_ENTERO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {corchete2}
        {   
            ////tokens.add(new token("CORCHETE2", yytext(), this.tabulaciones, yyline, yycolumn));
            //return new Symbol(sym.CORCHETE2, new token("CORCHETE2", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {corchete1}
        {   
            ////tokens.add(new token("CORCHETE1", yytext(), this.tabulaciones, yyline, yycolumn));
            //return new Symbol(sym.CORCHETE1, new token("CORCHETE1", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {dosPuntos}
        {   
            //tokens.add(new token("DOS_PUNTOS", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DOS PUNTOS");
            return new Symbol(sym.DOS_PUNTOS, new token("DOS_PUNTOS", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {distintoQue}
        {   
            //tokens.add(new token("DISTINTO_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DISTINTO QUE");
            return new Symbol(sym.DISTINTO_QUE, new token("DISTINTO_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {igualQue}
        {   
            //tokens.add(new token("IGUAL_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("IGUAL QUE");
            return new Symbol(sym.IGUAL_QUE, new token("IGUAL_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {menorQue}
        {   
            //tokens.add(new token("MENOR_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("MENOR QUE");
            return new Symbol(sym.MENOR_QUE, new token("MENOR_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {mayorQue}
        {   
            //tokens.add(new token("MAYOR_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("MAYOR QUE");
            return new Symbol(sym.MAYOR_QUE, new token("MAYOR_QUE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {or}
        {   
            //tokens.add(new token("OR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("OR");
            return new Symbol(sym.OR, new token("OR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {and}
        {   
            //tokens.add(new token("AND", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("AND");
            return new Symbol(sym.AND, new token("AND", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {decremento}
        {   
            //tokens.add(new token("DECREMENTO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DECREMENTO");
            return new Symbol(sym.DECREMENTO, new token("DECREMENTO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {incremento}
        {   
            //tokens.add(new token("INCREMENTO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("INCREMENTO");
            return new Symbol(sym.INCREMENTO, new token("INCREMENTO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {igual}
        {   
            //tokens.add(new token("IGUAL", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("IGUAL");
            return new Symbol(sym.IGUAL, new token("IGUAL", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {exponenciacion}
        {   
            //tokens.add(new token("EXPONENCIACION", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("EXPONENCIACION");
            return new Symbol(sym.EXPONENCIACION, new token("EXPONENCIACION", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {modulo}
        {   
            //tokens.add(new token("MODULO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("MODULO");
            return new Symbol(sym.MODULO, new token("MODULO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {division}
        {   
            //tokens.add(new token("DIVISION", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DIVISION");
            return new Symbol(sym.DIVISION, new token("DIVISION", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {multiplicacion}
        {   
            //tokens.add(new token("MULTIPLICACION", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("MULTIPLICACION");
            return new Symbol(sym.MULTIPLICACION, new token("MULTIPLICACION", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {resta}
        {   
            //tokens.add(new token("RESTA", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("RESTA");
            return new Symbol(sym.RESTA, new token("RESTA", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {suma}
        {   
            //tokens.add(new token("SUMA", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("SUMA");
            return new Symbol(sym.SUMA, new token("SUMA", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {coma}
        {   
            //tokens.add(new token("COMA", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("COMA");
            return new Symbol(sym.COMA, new token("COMA", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {parentesis2}
        {   
            //tokens.add(new token("PARENTESIS2", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("PARENTESIS2");
            return new Symbol(sym.PARENTESIS2, new token("PARENTESIS2", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {parentesis1}
        {   
            //tokens.add(new token("PARENTESIS1", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("PARENTESIS1");
            return new Symbol(sym.PARENTESIS1, new token("PARENTESIS1", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tabulacion}
        {   
            this.tabulaciones++;
            ////tokens.add(new token("TABULACION", yytext(), tabs));
            //return new Symbol(sym.TABULACION, new token("TABULACION", yytext(), tabs));
        }

    {incluir}
        {   
            ////tokens.add(new token("INCLUIR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("INCLUIR");
            return new Symbol(sym.INCLUIR, new token("INCLUIR", yytext(), this.tabulaciones, yyline, yycolumn));
        }
    {eliminar}
        {   
            //tokens.add(new token("ELIMINAR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("ELIMINAR");
            return new Symbol(sym.ELIMINAR, new token("ELIMINAR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {extiende}
        {   
            //tokens.add(new token("EXTIENDE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("EXTIENDE");
            return new Symbol(sym.EXTIENDE, new token("EXTIENDE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {hacer}
        {   
            //tokens.add(new token("HACER", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("HACER");
            return new Symbol(sym.HACER, new token("HACER", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {decrementar}
        {   
            //tokens.add(new token("DECREMENTAR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DECREMENTAR");
            return new Symbol(sym.DECREMENTAR, new token("DECREMENTAR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {incrementar}
        {   
            //tokens.add(new token("INCREMENTAR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("INCREMENTAR");

            return new Symbol(sym.INCREMENTAR, new token("INCREMENTAR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {mientras}
        {   
            //tokens.add(new token("MIENTRAS", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("MIENTRAS");
            return new Symbol(sym.MIENTRAS, new token("MIENTRAS", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {desde}
        {   
            //tokens.add(new token("DESDE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DESDE");
            return new Symbol(sym.DESDE, new token("DESDE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {instanciar}
        {   
            //tokens.add(new token("INSTANCIAR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("INSTANCIAR");
            return new Symbol(sym.INSTANCIAR, new token("INSTANCIAR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {principal}
        {   
            //tokens.add(new token("PRINCIPAL", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("PRINCIPAL");
            return new Symbol(sym.PRINCIPAL, new token("PRINCIPAL", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {destructor}
        {   
            //tokens.add(new token("DESTRUCTOR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DESTRUCTOR");
            return new Symbol(sym.DESTRUCTOR, new token("DESTRUCTOR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {constructor}
        {   
            //tokens.add(new token("CONSTRUCTOR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("CONSTRUCTOR");
            return new Symbol(sym.CONSTRUCTOR, new token("CONSTRUCTOR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {devolver}
        {   
            //tokens.add(new token("DEVOLVER", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("DEVOLVER");
            return new Symbol(sym.DEVOLVER, new token("DEVOLVER", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {escribir}
        {   
            //tokens.add(new token("ESCRIBIR", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("ESCRIBIR");
            return new Symbol(sym.ESCRIBIR, new token("ESCRIBIR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {leer}
        {   
            //tokens.add(new token("LEER", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("LEER");
            return new Symbol(sym.LEER, new token("LEER", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {sino}
        {   
            //tokens.add(new token("SINO", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("SINO");
            return new Symbol(sym.SINO, new token("SINO", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {entonces}
        {   
            //tokens.add(new token("ENTONCES", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("ENTONCES");
            return new Symbol(sym.ENTONCES, new token("ENTONCES", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {if}
        {   
            //tokens.add(new token("IF", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("IF");
            return new Symbol(sym.IF, new token("IF", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {clase}
        {   
            //tokens.add(new token("CLASE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("CLASE");
            return new Symbol(sym.CLASE, new token("CLASE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {propiedades}
        {   
            //tokens.add(new token("PROPIEDADES", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("PROPIEDADES");
            return new Symbol(sym.PROPIEDADES, new token("PROPIEDADES", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {metodos}
        {   
            //tokens.add(new token("METODOS", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("METODOS");
            return new Symbol(sym.METODOS, new token("METODOS", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {tipo_propiedades_metodos}
        {   
            //tokens.add(new token("PROPIEDADES_METODOS", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO DE PROPIEDAD");
            return new Symbol(sym.PROPIEDADES_METODOS, new token("PROPIEDADES_METODOS", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {booleano}
        {   
            //tokens.add(new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO BOOLEANO");
            return new Symbol(sym.TIPO_DATO_CUP, new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {numerosReales}
        {   
            //tokens.add(new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("NUMEROS REALES");
            return new Symbol(sym.TIPO_DATO_CUP, new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {numerosDecimales}
        {   
            //tokens.add(new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("NUMEROS DECIMALES");
            return new Symbol(sym.TIPO_DATO_CUP, new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {cadena}
        {   
            //tokens.add(new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("TIPO_DATO_CUP");
            return new Symbol(sym.TIPO_DATO_CUP, new token("TIPO_DATO_CUP", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {excepciones_variables_clase}
        {   
            System.out.println("ERROR");
            ////tokens.add(new token("ERROR", yytext(), this.tabulaciones, yyline, yycolumn));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {variables_clase}
        {   
            //tokens.add(new token("VARIABLE_CLASE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("VARIABLE CLASE");
            return new Symbol(sym.VARIABLE_CLASE, new token("VARIABLE_CLASE", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {excepciones_variables}
        {   
            System.out.println("ERROR");
            ////tokens.add(new token("ERROR", yytext(), this.tabulaciones, yyline, yycolumn));
            //return new Symbol(sym.ERROR, new token("ERROR", yytext(), this.tabulaciones, yyline, yycolumn));
        }

    {variables}
        {   
            //tokens.add(new token("VARIABLE", yytext(), this.tabulaciones, yyline, yycolumn));
            this.add("VARIABLE");
            return new Symbol(sym.VARIABLE, new token("VARIABLE", yytext(), this.tabulaciones, yyline, yycolumn));
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
            System.err.println("Error Léxico \"" + yytext() + "\" ["+ (yyline+1) + ":"+ (yycolumn+1) + ":"+ yychar + "]");
            return new Symbol(sym.error);
        }