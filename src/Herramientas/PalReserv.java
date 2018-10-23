package Herramientas;

import java.util.ArrayList;

/**
 *
 * @author felipe
 */
public class PalReserv {
    
    private ArrayList<String> token ;
    
    public PalReserv(){ token = new ArrayList<>(); }
    
    public void setToken(String token){ this.token.add(token); }
    
    /*Busca el token dentro del listado de las palabras reservadas
     regresa un true si lo encuentra y un falso si no*/
    public boolean Econtrado(String token){
        int i = 0;
        boolean encontrado = false;
        
        while( i < this.token.size() && !encontrado){ 
            if( token.equals(this.token.get(i))){
                encontrado = true;
            }
            i++;
        }      
      return encontrado;
    }
    
}
