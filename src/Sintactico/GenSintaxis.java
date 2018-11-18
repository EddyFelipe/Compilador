package Sintactico;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Felipe
 */
public class GenSintaxis {

    public static void main(String[] args){
     String[] opciones = new String[5];
     opciones[0] = "-destdir";
     opciones[1] = "src"+File.separator+"CodigoFases";
     opciones[2] = "-parser";
     opciones[3] = "CodigoSintaxis";
     opciones[4] = "src"+File.separator+"Sintactico"+File.separator+"Sintaxis.cup";
     
       try {
            java_cup.Main.main(opciones);
        } catch (IOException ex) {
            Logger.getLogger(GenSintaxis.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GenSintaxis.class.getName()).log(Level.SEVERE, null, ex);
        }
     
    }
}
