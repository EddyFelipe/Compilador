package Lexico;

%%

%class AlgotitmoLexico
%line
%column
%public
%standalone

/*Expresiones Regulares*/

/*para caracteres especiales*/
LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]

/*para numeros Z,R,Q,N*/
numero = [0-9]
digitos = {numero}+ 
Reales = -?{digitos}(\.{digitos})?

/*para cadenas*/
guion = \_
letras = [a-zA-Z]
Cadenas =  ({letras} | {guion})({letras}|{guion}|{digitos})* /*mas va para texto y variable*/

/*Para palabras reservadas*/
letrasMi = [a-z]
Tokens = {letrasMi}+

/*Para los signos*/
oplog = (\<|\>|\=|\!)\= | \< | \> | \&\& | \|\|

/*Operaciones Basicas*/
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

/*Simbolos */
DosPuntos = \:
ParentesisA = \(
ParentesisC = \)
Punto = \.
Coma = \,
CorcheteA = \[ 
CorcheteC = \]
Comillas = \"
PuntoComa = \;

/*Para los comentarios */
Lespeciales = \# | \$ | \@ | \' | \¿ | \? | \ñ | \Ñ | \! | á | é | í | ó | ú | Á | É | Í | Ó | Ú
OpBas = \+ | \- | \/ | \* | \^ | \%
Simbolos = \: | \( | \) | \. | \, | \[ | \] | \" | \;
caracteres =  {Cadenas} | {Lespeciales} | {Reales} | {OpBas} | {Simbolos}
Comentario = "//"({caracteres} | [ \t\f\r])* | "/*"({caracteres} | {WhiteSpace})*"*/"

/*Para los errores*/
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
{ErOpBas}       { System.out.println("ErOpBas: "+ yytext());}
{DosPuntos}     { System.out.println("Dos puntos: "+ yytext());}
{ParentesisA}   { System.out.println("Paréntesis abierto: "+ yytext());}
{ParentesisC}   { System.out.println("Paréntesis cerrado: "+ yytext());}
{Punto}         { System.out.println("Punto: "+ yytext());}
{Coma}          { System.out.println("Coma: "+ yytext());}
{CorcheteA}     { System.out.println("Corchete abierto: "+ yytext());}
{CorcheteC}     { System.out.println("Corchete cerrado: "+ yytext());}
{Comillas}      { System.out.println("Comillas: "+ yytext());}
{PuntoComa}     { System.out.println("Punto y coma: "+ yytext());}
{Tokens}        { System.out.println("Tokens: "+ yytext()); }
{Reales}        { System.out.println("Numero: "+ yytext()); }
{Cadenas}       { System.out.println("Texto: "+ yytext()); }
{Suma}          { System.out.println("Suma: "+ yytext()); }
{Resta}         { System.out.println("Resta: "+ yytext());}
{Multi}         { System.out.println("Multi: "+ yytext());}
{Div}           { System.out.println("Div: "+ yytext());}
{Mod}           { System.out.println("Mod: "+ yytext());}
{Potencia}      { System.out.println("Potencia: "+ yytext());}
{Inc}           { System.out.println("Inc: "+ yytext());}
{Dec}           { System.out.println("Dec: "+ yytext());}
{IncAbr}        { System.out.println("IncAbr: "+ yytext());}
{DecAbr}        { System.out.println("DecAbr: "+ yytext());}
{Asignacion}    { System.out.println("Asignacion: "+ yytext());}
{oplog}         { System.out.println("Operador: " + yytext()); }
{WhiteSpace}    {}