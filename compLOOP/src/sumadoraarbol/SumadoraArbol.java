package sumadoraarbol;

import java.io.FileReader;

public class SumadoraArbol {

    public static void main(String[] args) {
       try {
            AnalizadorLexico lex = new AnalizadorLexico(new FileReader("numeros.txt"));
            AnalizadorSintactico parser = new AnalizadorSintactico(lex);
            parser.parse();
            parser.arbolSintactico.setGraphvizPath("dot");
            parser.arbolSintactico.recorrerArbol();
            parser.arbolSintactico.recorrerArbol(Arbol.TIPO_RECORRIDO_GRAFO);
        } 
        catch (java.lang.Exception el)
        {
            System.out.println("error encontrado: "+el.getMessage()); 
        }
    }
    
}
