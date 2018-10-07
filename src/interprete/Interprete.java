package interprete;

import Lexico.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author felipe
 */
public class Interprete {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        FileInputStream stream = null;
        try {
            AlgotitmoLexico scanner;
            stream = new FileInputStream("src"+File.separator+"Lexico"+File.separator+"Tokens.txt");
            java.io.Reader reader = new java.io.InputStreamReader(stream);
            scanner = new AlgotitmoLexico(reader);
            while ( !scanner.zzAtEOF ) scanner.yylex();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Interprete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Interprete.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stream.close();
            } catch (IOException ex) {
                Logger.getLogger(Interprete.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
