package compiladorloop;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CompiladorLOOP {

    public static void main(String[] args) {
        try {
            //Instancia de analizador léxico
            String nombreArchivo = "src/inputs/input.txt";
            AnalizadorLexico analizador = new AnalizadorLexico(new FileReader(nombreArchivo));
            //Instancia de analizador sintáctico
            AnalizadorSintactico as = new AnalizadorSintactico(analizador);
            as.parse();
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(CompiladorLOOP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(CompiladorLOOP.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Primer");
    }
    
}
