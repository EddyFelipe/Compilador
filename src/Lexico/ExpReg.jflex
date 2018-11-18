package CodigoFases;
import Herramientas.*;
import java_cup.runtime.Symbol;

%%

%class CodigoLexico
%line
%column
%cup
%public

/*VARIABLES GLOBALES*/
%{

%}
/*CODIGO EN EL CONSTRUCTOR*/
%init{
   /*TablaSimbolos tabl = new TablaSimbolos();*/
%init}

/****************Expresiones Regulares************************/

/**********para caracteres especiales***************/
LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]

/**************para numeros Z,R,Q,N*****************/
numero = [0-9]
digitos = {numero}+ 
Reales = -?{digitos}(\.{digitos})?

/********************para cadenas*****************/
guion = \_
letras = [a-zA-Z]
Cadenas =  ({letras} | {guion})({letras}|{guion}|{digitos})* /*mas va para texto y variable*/

/***************Para palabras reservadas********************/
letrasMi = [a-z]
Tokens = {letrasMi}+

/*****************Para los signos*************************/
oplog = (\<|\>|\=|\!)\= | \< | \> | \&\& | \|\|

/***************Operaciones Basicas*********************/
Suma = \+
Resta = \-
Multi= \*
Div =  \/
Mod = \%
Potencia = \^
Inc = \+\+ 
Dec = \-\-
IncAbr = \+\=
DecAbr = \-\=
Asignacion = \=

/*******************Simbolos*****************************/
Punto = \.
Coma = \,
CorcheteA = \[ 
CorcheteC = \]
Comillas = \"

/*****************Para los comentarios*******************/
Lespeciales = \# | \$ | \@ | \' | \¿ | \? | \ñ | \Ñ | \! | á | é | í | ó | ú | Á | É | Í | Ó | Ú
OpBas = \+ | \- | \/ | \* | \^ | \%
Simbolos = \: | \( | \) | \. | \, | \[ | \] | \" | \;
caracteres =  {Cadenas} | {Lespeciales} | {Reales} | {OpBas} | {Simbolos}
Comentario = "//"({caracteres} | [ \t\f\r])* | "/*" ~"*/"

/****************Para los errores**********************/
ErCadena = {Reales}{letras}({caracteres} | {guion} | {Reales} )*
//ErOplog = ( \= | \! | \& | \| | \< | \>)( \= | \! | \& | \| | \< | \>)( \= | \! | \& | \| | \< | \>)*
ErAdicionales = \! | \= | \& | \|
ErOplog = (({oplog} | {ErAdicionales})+({oplog})({oplog} | {ErAdicionales})* | ({oplog} | {ErAdicionales})*({oplog})({oplog} | {ErAdicionales})+)
| \=\!
ErOpBas = ({OpBas})+({OpBas})({OpBas})* | ({OpBas})*({OpBas})({OpBas})+

/****************Indentacion***************************/
Identacion = "    "
DobbIdentacion = {Identacion}{2}


%state STRING

%%
/**/
<YYINITIAL>{
{WhiteSpace}    {}
{Comentario}    { System.out.println("Comentario: "+ yytext()); }
"boleano"       {}
"cadena"        {}
"clase"         {}
"codigo"        { return new Symbol(sym.CODIGO); }
"desde"         {}
"escribir"      {}
"entonces"      {}
"encaso"        {}
"funcion"       { return new Symbol(sym.FUNCION); }  
"falso"         {}
"hacer"         {}
"iterar"        {}
"incrementar"   {}
"incluir"       { return new Symbol(sym.INCLUIR); }
"leer"          {}
"mientras"      {}
"numero"        { return new Symbol(sym.NUMERO); }
"nulo"          {}
"paracada"      {}
"principal"     { return new Symbol(sym.PRINCIPAL); }
"retornar"      { return new Symbol(sym.RETORNAR); }
"si"            {}
"sino"          {}
"verdadero"     {}
"variable"      { return new Symbol(sym.VARIABLE); }
"("             { return new Symbol(sym.PARAB); }
")"             { return new Symbol(sym.PARCE); }
"0"             { return new Symbol(sym.ENTERO); }
":"             { return new Symbol(sym.DPUNTO); }
";"             { return new Symbol(sym.PUNTOCOMA); }
{Identacion}    { return new Symbol(sym.TAB); }
{Cadenas}       { return new Symbol(sym.ID); }
\"              {   yybegin(STRING);
                    return new Symbol(sym.COMILLA);
                  } 
}

<STRING>{
 \"             {   yybegin(YYINITIAL);
                    return new Symbol(sym.COMILLA);
                }
/*Hay que hacer alguna modificacion en el nombre de incluir*/
 {caracteres}      {  System.out.println("ID: "+yytext());
                    return new Symbol(sym.ID); }
}
