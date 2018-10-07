package Lexico;

import java.io.File;

/**
 *
 * @author Felipe
 */
public class GenerLexico {
    
    public static void main(String[] args){
      jflex.Main.generate(new File("src"+File.separator+"Lexico"+File.separator+"ExpReg.jflex"));
    }
}
