package sumadoraarbol;

import java.util.ArrayList;
import java.util.List;


public class Nodo {
    private int tipo;
    private int operador;
    private int valor;
    private String identificador;
    private String identificador_clase;
    private int reservada;
    private final ArrayList<Nodo> hijos;
//SIGNOS
    public static final int PUNTO_Y_COMA = 28;
    public static final int DOS_PUNTOS = 27;
    public static final int PARENTESIS2 = 22;
    public static final int PARENTESIS1 = 21;
    public static final int COMA = 23;
    public static final int MENOS = 32;
    public static final int PUNTO = 33;
//EXTRAS
    public static final int EOF = 0;
    public static final int error = 1;
//VARIABBLES
    public static final int VARIABLE_CLASE = 34;
    public static final int VARIABLE = 29;
//FUNCIONES EXTRAS
    public static final int TANGENTE = 52;
    public static final int COSENO = 51;
    public static final int CADENA_A_ENTERO = 57;
    public static final int CADENA_A_REAL = 56;
    public static final int SENO = 50;
    public static final int CADENA_A_BOOLEANO = 55;
//tipos de datos
    public static final int TIPO_DATO_CUP = 36; 
//OPERADORES ARITMETICOS Y LOGICOS
    public static final int DIVISION = 41;
    public static final int MULTIPLICACION = 40;
    public static final int MENOR_QUE = 44;
    public static final int IGUAL_QUE = 47;
    public static final int RESTA = 39;
    public static final int AND = 25;
    public static final int IGUAL = 24;
    public static final int OR = 26;
    public static final int INCREMENTO = 17; 
    public static final int MAYOR_QUE = 45;   
    public static final int MODULO = 43;
    public static final int DECREMENTO = 18;
    public static final int SUMA = 38;
    public static final int DISTINTO_QUE = 46;
    public static final int LOGARITMO = 53;
    public static final int EXPONENCIACION = 42;
    public static final int RAIZ = 30;
//PALABRAS RESERVAAS
    public static final int PROPIEDADES_METODOS = 54;
    public static final int ELIMINAR = 35;
    public static final int DEVOLVER = 10;
    public static final int DESDE = 15;
    public static final int ENTONCES = 6;
    public static final int DECREMENTAR = 49;
    public static final int INSTANCIAR = 14;
    public static final int INCREMENTAR = 48;
    public static final int SINO = 7;
    public static final int MIENTRAS = 16;
    public static final int EXTIENDE = 20;
    public static final int ESCRIBIR = 9;
    public static final int IF = 5;
    public static final int CLASE = 2;
    public static final int NUEVO = 31;
    public static final int METODOS = 4;
    public static final int LEER = 8;
    public static final int HACER = 19;
    public static final int PROPIEDADES = 3;
    public static final int DESTRUCTOR = 12;
    public static final int PRINCIPAL = 13;
    public static final int CONSTRUCTOR = 11;

    public static final int TIPO_EXPRESION=102;
    public static final int TIPO_RESERVADA=104;
    public static final int TIPO_NUMERO=103;
    public static final int TIPO_OPERADOR=100;
    public static final int TIPO_IDENTIFICADOR=101;
    public static final int TIPO_IDENTIFICADOR_CLASE=105;

    /**
     *
     * @param tipo de nodo a crear
     * @param valor del nodo a crear
     */
    public Nodo(int tipo, int valor) {
        this.hijos = new ArrayList<>();  
        this.tipo = tipo;
        switch (this.tipo) {
            case Nodo.TIPO_EXPRESION:
                break;
            case Nodo.TIPO_RESERVADA:
                this.reservada = valor;
                break;                
            case Nodo.TIPO_NUMERO:
                this.valor = valor;
                break;
            case Nodo.TIPO_OPERADOR:
                this.operador = valor;
                break;
            case Nodo.TIPO_IDENTIFICADOR:
                break;
            case Nodo.TIPO_IDENTIFICADOR_CLASE:
                break;                
        }
    }
    
    /**
     *
     * @param tipo de nodo a crear
     * @param valor del nodo a crear
     */
    public Nodo(int tipo, String valor) {
        this.hijos = new ArrayList<>();  
        this.tipo = tipo;
        switch (this.tipo) {
            case Nodo.TIPO_EXPRESION:
                break;
            case Nodo.TIPO_NUMERO:
                break;
            case Nodo.TIPO_OPERADOR:
                break;
            case Nodo.TIPO_RESERVADA:
                break;
            case Nodo.TIPO_IDENTIFICADOR:
                this.identificador = valor;
                break;
            case Nodo.TIPO_IDENTIFICADOR_CLASE:
                this.identificador_clase = valor;
                break;
                
        }
    }
    
    public Nodo(int valor) {
        this.hijos = new ArrayList<>();
        this.tipo=TIPO_NUMERO;
        this.valor=valor;
        this.operador=0;
      //  this.identificador_clase=0;
    }
    
    public Nodo() {
        this.hijos = new ArrayList<>();
        this.tipo=0;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the operador
     */
    public int getOperador() {
        return operador;
    }
    public int getReservada() {
        return reservada;
    }
    public String getOperadorString() {
        switch (operador) {
            case DIVISION:
                return "/";
            case MULTIPLICACION:
                return "*";
            case SUMA:
                return "+";
            case RESTA:
                return "-";
            case IGUAL:
                return "=";
            case MENOR_QUE:
                return "<";
            case IGUAL_QUE:
                return "==";
            case AND:
                return "and";
            case OR:
                return "or";
            case INCREMENTO:
                return "++";
            case MAYOR_QUE:
                return ">";
            case MODULO:
                return "mod";
            case DECREMENTO:
                return "--";
            case DISTINTO_QUE:
                return "!=";
            case LOGARITMO:
                return "log";
            case EXPONENCIACION:
                return "^";
            case RAIZ:
                return "raiz"; 
            case PUNTO_Y_COMA:
                return ";"; 
            case DOS_PUNTOS:
                return ":"; 
            case PARENTESIS1:
                return "("; 
            case PARENTESIS2:
                return ")";    
            case COMA:
                return ",";
            case PUNTO:
                return "punto";                                               
        }
        return "na";
    }
    public String getReservadaString() {
        switch (reservada) {
          //  case PROPIEDADES_METODOS:
            ///    return "/";
            case ELIMINAR:
                return "eliminar";
            case DEVOLVER:
                return "devolver";
            case DESDE:
                return "desde";   
            case ENTONCES:
                return "entonces";
            case DECREMENTAR:
                return "decrementar";
            case INSTANCIAR:
                return "instanciar";
            case SINO:
                return "sino";
            case MIENTRAS:
                return "mientras";
            case EXTIENDE:
                return "extiende";
            case ESCRIBIR:
                return "escribir";
            case IF :
                return "if";
            case CLASE:
                return "clase";
            case NUEVO:
                return "nuevo";
            case METODOS:
                return "metodos";
            case LEER:
                return "leer";
            case HACER:
                return "hacer";
            case PROPIEDADES:
                return "propiedades";
            case DESTRUCTOR:
                return "destructor";
            case PRINCIPAL:
                return "principal";    
            case CONSTRUCTOR:
                return "constructor";
            case LOGARITMO:
                return "logaritmo";
            case TANGENTE:
                return "tangente";
            case COSENO:
                return "coseno";
            case CADENA_A_ENTERO:
                return "cadena_a_entero";
            case CADENA_A_REAL:
                return "cadena_a_real";
            case SENO:
                return "seno";
            case CADENA_A_BOOLEANO:
                return "cadena_a_booleano";                     
        }
        return "na";
    }

    /**
     * @param operador the operador to set
     */
    public void setOperador(int operador) {
        this.operador = operador;
    }
    public void setReservada(int reservada) {
        this.reservada = reservada;
    }
    /**
     * @return the valor
     */
    public int getValor() {
        return valor;
    }

    /**
     * @return the identificador
     */
    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public void setIdentificador_clase(String identificador_clase) {
        this.identificador_clase = identificador_clase;
    }
    
    public String getIdentificador_clase() {
        return identificador_clase;
    }    
    /**
     * @param valor the valor to set
     */
    public void setValor(int valor) {
        this.valor = valor;
    }

    /**
     * @return the hijos
     */
    public List<Nodo> getHijos() {
        return hijos;
    }
    
    public boolean agregarHijo(Nodo nodo){
        return hijos.add(nodo);
    }
}
