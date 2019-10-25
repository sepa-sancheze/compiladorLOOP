package createdClasses;

import java.util.ArrayList;

public class token {
    private String tipo;
    private String lexema;
    private ArrayList<token> hijos;

    public token(String tipo, String lexema) {
        this.hijos = new ArrayList<>();
        this.tipo = tipo;
        this.lexema = lexema;
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
    
    
    
}
