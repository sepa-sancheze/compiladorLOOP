package tools;

public class GeneradorJFlex {
    public static void main(String[] args) {
        //Analizador Léxico
        String[] opciones = new  String[3];
        opciones[0] = "-d";
        opciones[1] = "src/compiladorloop";
        opciones[2] = "src/libraries/loop.jflex";
        jflex.Main.main(opciones);

    }
    
}
