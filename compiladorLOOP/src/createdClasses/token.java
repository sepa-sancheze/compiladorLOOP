package createdClasses;

import java.util.ArrayList;

public class token {
    private String tipo;
    private String lexema;
    private ArrayList<token> hijos;
    private int tabulaciones;

    public token(String tipo, String lexema, int tabulaciones) {
        this.hijos = new ArrayList<>();
        this.tipo = tipo;
        this.lexema = lexema;
        this.tabulaciones = tabulaciones;
    }

    public token(String tipo, String lexema, ArrayList<token> hijos, int tabulaciones) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.hijos = hijos;
    }
    
    public void agregarHijo(token t){
        this.hijos.add(t);
    }
    
    public ArrayList<token> getHijos() {
        return hijos;
    }

    public void setHijos(ArrayList<token> hijos) {
        this.hijos = hijos;
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

    public int getTabulaciones() {
        return tabulaciones;
    }

    public void setTabulaciones(int tabulaciones) {
        this.tabulaciones = tabulaciones;
    }
    
    
    
}
