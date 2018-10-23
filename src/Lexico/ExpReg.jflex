package Lexico;
import Herramientas.*;

%%

%class AlgotitmoLexico
%line
%column
%public
%standalone

/*VARIABLES GLOBALES*/
%{

%}
/*CODIGO EN EL CONSTRUCTOR*/
%init{
   TablaSimbolos tabl = new TablaSimbolos();
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
DosPuntos = \:
ParentesisA = \(
ParentesisC = \)
Punto = \.
Coma = \,
CorcheteA = \[ 
CorcheteC = \]
Comillas = \"
PuntoComa = \;

/*****************Para los comentarios*******************/
Lespeciales = \# | \$ | \@ | \' | \¿ | \? | \ñ | \Ñ | \! | á | é | í | ó | ú | Á | É | Í | Ó | Ú
OpBas = \+ | \- | \/ | \* | \^ | \%
Simbolos = \: | \( | \) | \. | \, | \[ | \] | \" | \;
caracteres =  {Cadenas} | {Lespeciales} | {Reales} | {OpBas} | {Simbolos}
Comentario = "//"({caracteres} | [ \t\f\r])* | "/*"({caracteres} | {WhiteSpace})*"*/"

/****************Para los errores**********************/
ErCadena = {Reales}{letras}({caracteres} | {guion} | {Reales} )*
//ErOplog = ( \= | \! | \& | \| | \< | \>)( \= | \! | \& | \| | \< | \>)( \= | \! | \& | \| | \< | \>)*
ErAdicionales = \! | \= | \& | \|
ErOplog = (({oplog} | {ErAdicionales})+({oplog})({oplog} | {ErAdicionales})* | ({oplog} | {ErAdicionales})*({oplog})({oplog} | {ErAdicionales})+)
| \=\!
ErOpBas = ({OpBas})+({OpBas})({OpBas})* | ({OpBas})*({OpBas})({OpBas})+


%%
/**/
{Comentario}    { System.out.println("Comentario: " + yytext()); }
{ErCadena}      { System.out.println("Error: " + yytext()); }
{ErOplog}       { System.out.println("ErLOg: " + yytext()); }
{ErOpBas}       { TablaSimbolos.EscribirSimbolos(yytext()); }
{DosPuntos}     { TablaSimbolos.EscribirSimbolos(yytext()); }
{ParentesisA}   { TablaSimbolos.EscribirSimbolos(yytext()); }
{ParentesisC}   { TablaSimbolos.EscribirSimbolos(yytext()); }
{Punto}         { TablaSimbolos.EscribirSimbolos(yytext()); }
{Coma}          { TablaSimbolos.EscribirSimbolos(yytext()); }
{CorcheteA}     { TablaSimbolos.EscribirSimbolos(yytext()); }
{CorcheteC}     { TablaSimbolos.EscribirSimbolos(yytext()); }
{Comillas}      { TablaSimbolos.EscribirSimbolos(yytext()); }
{PuntoComa}     { TablaSimbolos.EscribirSimbolos(yytext()); }
{Tokens}        { TablaSimbolos.Buscar(yytext()); }
{Reales}        { TablaSimbolos.EscribirNumeros(yytext()); }
{Cadenas}       { TablaSimbolos.EscribirIdentificador(yytext()); }
{Suma}          { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Resta}         { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Multi}         { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Div}           { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Mod}           { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Potencia}      { TablaSimbolos.EscribirOperacionesBas(yytext());}
{Inc}           { TablaSimbolos.EscribirOperacionesBas(yytext()); }
{Dec}           { TablaSimbolos.EscribirOperacionesBas(yytext()); }
{IncAbr}        { TablaSimbolos.EscribirOperacionesBas(yytext()); }
{DecAbr}        { TablaSimbolos.EscribirOperacionesBas(yytext()); }
{Asignacion}    { TablaSimbolos.EscribirOperacionesBas(yytext()); }
{oplog}         { TablaSimbolos.EscribirLogico(yytext()); }
{WhiteSpace}    {}