package tools;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

//java -jar nombreJar       -> para ejecutar jar's desde terminal
//args = jcup -destdir path -parser fileClass archivo.jcup

public class GeneradorCup {
    public static void main(String[] args) {
        
        String parametros[] = new String[5];
        parametros[0] = "-destdir";
        parametros[1] = "src/compiladorloop";
        parametros[2] = "-parser";
        parametros[3] = "AnalizadorSintactico";
        parametros[4] = "src/libraries/loop.jcup";
        
        try {
            
            java_cup.Main.main(parametros);
            
        } catch (IOException ex) {
            Logger.getLogger(GeneradorCup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GeneradorCup.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
