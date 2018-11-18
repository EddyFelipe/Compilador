package Lexico;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;
import jflex.SilentExit;

/**
 *
 * @author Felipe
 */
public class GenerLexico {
    
    public static void main(String[] args){
        try {
            String[] opciones = new String[3];
            opciones[0] = "-d";
            opciones[1] = "src"+File.separator+"CodigoFases";
            opciones[2] = "src"+File.separator+"Lexico"+File.separator+"ExpReg.jflex";
            
            jflex.Main.generate(opciones);
        } catch (SilentExit ex) {
            Logger.getLogger(GenerLexico.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
