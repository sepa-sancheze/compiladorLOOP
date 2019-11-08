package sumadoraarbol;

import java.util.ArrayList;

public class token {
    private String tipo;
    private String lexema;
    private ArrayList<token> hijos;
    private int tabulaciones;
    private int linea;
    private int columna;

    public token(String tipo, String lexema, ArrayList<token> hijos, int tabulaciones, int linea, int columna) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.hijos = hijos;
        this.tabulaciones = tabulaciones;
        this.linea = linea;
        this.columna = columna;
    }

    public token(String tipo, String lexema, int tabulaciones, int linea, int columna) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.tabulaciones = tabulaciones;
        this.linea = linea;
        this.columna = columna;
    }
    
    
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public ArrayList<token> getHijos() {
        return hijos;
    }

    public void setHijos(ArrayList<token> hijos) {
        this.hijos = hijos;
    }

    public int getTabulaciones() {
        return tabulaciones;
    }

    public void setTabulaciones(int tabulaciones) {
        this.tabulaciones = tabulaciones;
    }
    public int getLinea() {
        return linea + 1;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
}
