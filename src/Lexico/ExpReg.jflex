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
Reales = -?{digitos}(.{digitos})?

/*para cadenas*/
guion = \_
letras = [a-zA-Z]
Cadenas =  ({letras} | {guion})({letras}|{guion}|{digitos})* /*mas va para texto y variable*/

/*Para palabras reservadas*/
letrasMi = [a-z]
Tokens = {letrasMi}+

/*Para los signos*/
oplog = (\<|\>|\=|\!)\= | \< | \> | \&\& | \|\|

/*Para los comentarios */
Lespeciales = \# | \$ | \@ | \' | \¿ | \? | \ñ | \Ñ | \! | á | é | í | ó | ú | Á | É | Í | Ó | Ú
Comentario = ( \/\/ )( {Cadenas} | {Lespeciales} | {digitos} | {WhiteSpace} )* | ( \/\* )( {Cadenas} | {Lespeciales} | {digitos} | {WhiteSpace})*( \*\/ )

/*Para los errores*/
ErCadena = {numero}+({letras}|{digitos}|{guion})*
/*ErOplog = ( \< | \> | \= | \! | \& | \|)*(\<\<+| \<\> | \>\> | \!\> | \!\<)+( \< | \> | \= | \! | \& | \|)**/

%%
/**/
{Comentario}    { System.out.println("Comentario: " + yytext()); }
{ErCadena}      { System.out.println("Error: " + yytext()); }
{Tokens}        { System.out.println("Tokens: "+ yytext()); }
{Reales}        { System.out.println("Numero: "+ yytext()); }
{Cadenas}       { System.out.println("Texto: "+ yytext()); }
{oplog}         { System.out.println("Operador: " + yytext()); }
{WhiteSpace}    {}