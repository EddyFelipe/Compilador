package interprete;


import CodigoFases.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.File;

/**
 *
 * @author felipe
 */
public class Interprete {
    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) {
        try {
            CodigoLexico analizadorlexico = new CodigoLexico(new FileReader("src"+File.separator+"Lexico"+File.separator+"Tokens.txt"));
            CodigoSintaxis analizadorSintactico = new CodigoSintaxis(analizadorlexico);
            analizadorSintactico.parse();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Interprete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Interprete.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
