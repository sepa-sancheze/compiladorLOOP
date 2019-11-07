/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package sumadoraarbol;

import java.util.ArrayList;

/**
 * 
 * @author Dhaby Xiloj <dhabyx@gmail.com>
 * 
 * Clase para almacenar la estructura de cada token devuelto por el analizador
 * léxico.
 * 
 * Su funcionalidad se limita a la explicación de cómo debe almacenarse la 
 * información de los tokens y nó está optimizado para funcionar de la manera 
 * mas óptima.
 * 
 */
public class token {
    private String tipo;
    private String lexema;
    private ArrayList<token> hijos;
    private int tabulaciones;

    public token(String tipo, String lexema, ArrayList<token> hijos, int tabulaciones) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.hijos = hijos;
        this.tabulaciones = tabulaciones;
    }

    public token(String tipo, String lexema, int tabulaciones) {
        this.hijos = new ArrayList<>();
        this.tipo = tipo;
        this.lexema = lexema;
        this.tabulaciones = tabulaciones;
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
    
}
