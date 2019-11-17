package sumadoraarbol;

import java.io.FileReader;
import java.util.ArrayList;

public class SumadoraArbol {

    public static void main(String[] args) {
        try {
            AnalizadorLexico lex = new AnalizadorLexico(new FileReader("numeros.txt"));
            AnalizadorSintactico parser = new AnalizadorSintactico(lex);
            parser.parse();
            parser.arbolSintactico.setGraphvizPath("dot.exe");
            parser.arbolSintactico.recorrerArbol();
            parser.arbolSintactico.recorrerArbol(Arbol.TIPO_RECORRIDO_GRAFO);
            System.out.println("Prueba");
            ArrayList <Simbolos> sim = lex.sim;
            EscribirenFichero es = new EscribirenFichero();
            es.escribir(sim);
        } catch (java.lang.Exception el) {
            System.out.println("error encontrado: " + el.getMessage());
        }
    }

}
