-- ESTE ES EL PRIMER PAQUETE DE TRES QUE ES ALMACENARAN EN GIT
-- ESTE PRIMER PAQUETE MUESTRA LAS GENRARLIDADES DEL PROGRAMA SAS

-- notacion de sas ----------------
-- VIDEO 3
DATA NOMBRE_DE_TABLA; -- CON ESTA NOTACION SE CREAN TABLAS EN SAS.
INFILE '/../RUTA/DEL/ARCHIVO.txt'; -- CON ESTA NOTACION SE INDICA LA RUTA DEL ACHIVO A IMPORTAR (SON NECESARIOS LAS COMILLAS DOBLES)
INPUT PERIODO SALARIO -- SENTENCIA PARA INDICAR LOS LOMBRES DE LOS CAMPOS O VARIBLES A INGRESAR DEPENDERA DE LA CANTIIDAD DE CAMPOS EN EL ARCHIVO(LOS NOMBRES VAN SIN COMILLAS)
RUN; -- CON ESTA SENTENCIA INDICAMOS QUE LAS QUE ESTE ENTRE DATA Y RUN SE DEBE EJECUTAR
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 4 -------------------------
-- importar archivos 
DATA ALIMENTOS; -- CREA UNA NUEVA TABLA LLAMADA Alimentos
-- INFILE SE UNA PARA TRASAR LA RUTA DEL ARCHIVO 
-- DSD : LIMPIA EL DATO SI SE ENCUENTRA ENTRE COMILLAS ES DECIR "EJEMPLO" => EJEMPLO
-- MISSOVER : LIMPIA EL DATO DE ESPACIOS EN BLANCO ESTO ES 2,2,,5,6, => 2,2,nan,5,6, Y RESPETA LOS ESPACIOAS BACIOS
-- FIRSTOBS : INDICA EN QUE NUMERO DE FILA COMIENZAN EL PRIMER REGISTRO
INFILE '/home/u63720089/sasuser.v94/weightgain (2).csv' DSD MISSOVER FIRSTOBS=2;
INPUT ID ALIMENTO$ TIPO$ PESO; -- A LAS VARIABLES QUE SE LES AGREGA UN $ SON DE TIPO CARACTER O STRING 
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 5 -------------------------
-- importat XLSX
-- en fracmento de codigo se encuentran partes de codigos que ayudan en las rutinas de pre cargao de documentos
--solamente es requiere de <Your XLSX File> se cambie por la ruta del archivo
PROC IMPORT DATAFILE="<Your XLSX File>"
		    OUT=WORK.MYEXCEL
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=WORK.MYEXCEL; RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- con la sentencia proc se usa para trabajar con datos
-- PROC REQUIERE DE UNA KEYWORD PARA REALIZAR EL PROCESO REQUERIDO EN ESTE CASO SE UTILIZA IMPORT
PROC IMPORT -- CON IMPORT SE IMPORTA EL ARCHIVO XLMXS QUE UNO QUIERE
	OUT=VENTAS -- CON OUT SE LE DA EL NOMBRE A LA TABLA 
	DATAFILE='RUTA_DEL DOCUMENTO' -- NUEVAMENTE SE USA PARA LLAMAR LA RUTA DEL ACHIVO
	DBMS=typo_archivo -- CON ESTA SENTENCIA SE LE ASIGNA EL TIPO DE ACHIVO(XLSX)
	REPLACE; --REMPLAZA CUALQUIER TABLA QUE TENGA EN NOMBRE DE VENTAS POR LOS NUEVOS DATOS QUE VIENES DEL DOCUMENTO
	SHEET="HOJA_1"; -- SE USA EN EL CASO DE QUE SE TENGA MAS DE UNA HOJA DE CALCULO COLOCANDO 
				   --ENTRE COMILLAR EL NMERO DE LA HOJA O EL NOMBRE NO SE NECESARIO SI SOLO TIENE UNA HOJA
	GETNAMES= YES; --NOS PERMITE INDICAR SI SE DESEA QUE LOS NOMBRES DE CAMPOS 
					--QUE ESTAN EN EL ARCHIVO DE EXEL SE CONSIDEREN PARA GENERAR LOS CAMPOS DE LA TABLA A CREAR(ESTA ISTRUCCION DEBE LLEVAR ;)
	
RUN;-- CERRAR EL PROCESO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ESTE PROCESO ES DIFERENTE YA QUE PERMITE IMPRIMIR A MANERA DE RESUMEN LA TABLA QUE SE TIENE
-- ESTA INSTRUCCION NO ESTA DISPONIBLE EN WSP SOLO EN SAS STUDIO
PROC PRINT DATA=NOMBRE_TABLA;-- AL APLICARLE DATA ESTA TOMA LA TABLA CON EL NOMBRE QUE SE LE ASIGNE Y ESTE GUSRADADO DENTRO DE NUESTRO PROGRAMA
RUN; -- CERRAR EL PROCESO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 6 -------------------------
-- Librerias
-- POR DEFECTO SAS GUARDA TODA LAS TABLAS EN LA LIBRERIA WORK QUE SE ENCUENTRA EN LA PESTANA LIBRERIAS
-- WORK ES UN ESPACIO TEMPORAL TOLO QUE SE GUARDE DENTRO DESPUES DE FINALIZAR EL PORCESO SE ELIMINA
PROC CONTENTS -- PERMITE VISULAIZAR LOS DATOS DE FORMA GENERAL DE LAS TABLAS QUE DESEAMOS MOSTRAR
	DATA=VENTAS -- PERMITE DETERMINAR QUE TABLA SE LE VA A REALIZAR EL PROCESO
	VARNUM;-- PERMITEE VISUALIZXAR LAS VARIABLE O NOMBRES DE CAMPOS DE LA MISMA MANERA EN QUE SE ENCUENTRAN ORDENADOS EN LA TABLA
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SE PUEDE CREAR UNA CARPETA NUEVA EN CUAL ALMACENE TODAS LAS LIBRERIAS Y NO SE BORREN COMO EN WORK
-- NOTA ESTA SENTENCIA ES MEJOR USARLA EN WSP YA QUE ESTE NO ALMACENA NADA EN LA ARPETA WORK
-- PERO SAS STUDIO DE FORMA OLINE SI ALMACEN LAS TABLAS QUE SE HAN REALIZADO
LIBNAME RUTA 'RUTA_DE_LA _CARPETA'; -- CON ESTA SENTENCIA DE LE ASIGNA A LA RUTA DE LA CARPETA EL GUARDADO DE LOS ARCHIVOS DE LIBRERIA
										--RUTA ES UN ALIAS QUE SE LE DA A LA RUTA DEL ARCHIVO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PARA ALMACENAR LAS NUEVAS TABLAS EN LA CARPETA SIMPLEMENTE AL NOMBRE DE LA TABLA EN SE LE AGREGA EL ALIAS QUE SE LE DIO A ESTA RUTA
PROC IMPORT
	OUT=RUTA.VENTAS -- CON ESTE ALIAS EL PROGRAMA YA ENTIENDE QUE SE DEBE GUARDAR LA TABLA EN ESTA RUTA
	DATAFILE='/home/u63720089/sasuser.v94/Sample-Sales-Data (3).xlsx'
	DBMS=XLSX
	REPLACE;
	GETNAMES=YES;
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 7 -------------------------
-- Dataset Options
-- LA NOTACION EN SAS SE REALISA CON /*... */ 

DATA RUTA2.SALARIOS(KEEP=SALARIO RENAME=SALARIO=SALARIO_EMP); -- LA SENTENCIA KEEP SE USA PARA MANTENER EL NOMBRE DE LA COLUMNA ESPECIFICADA
															-- LA SENTENCIA RENAME RE-NOMBRAR EL CAMPO DESEADO
INFILE '/home/u63720089/sasuser.v94/salary (2).txt';
INPUT PERIODO SALARIO;
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PROC PRINT
	DATA=RUTA2.SALARIOS(OBS=3); -- CON LA SENTENCIA OBS SE PUEDE MODIFICAR LA CANTIDAD DE REGISTRO QUE NOS MUESTA EL PROC PRINT
	DATA=RUTA2.SALARIOS(FIRSTOBS=3 OBS=3); -- CON LA SENTENCIA FIRSTOBS SE PIDE QUE EL PRIMER REGISTRO SEA EL 3 UY CON OBS SE PIDE QUE EL LIMITE SEA EL 3 
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 7 -------------------------
-- Delimitadores
-- EL DELIMITADOR ES EL CARACTES QUE AYUDARA A SEPARA LOS DATOS ESTOS PUEDEN SER (ESPACIO,'.',';',',','|')
DATA RUTA2.SALARIOS; -- CON DLM SE ESTA ESPECIFICANDO EL EL CARACTER QUE AYUDARA DE LIMITADOR ESTO DEPENDERA DEL COMO VENGA EL ARCHIVO
INFILE '/home/u63720089/sasuser.v94/salary (2).txt' DLM=".";
INPUT PERIODO SALARIO;
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VIDEO 8 -------------------------
-- AGREGAR DATOS
-- EN ESTA CLASE SE MUESTREA COMO SE AGREGAN LOS DATOS DENTRO DEL CODIGO, PARA QUE SE PUEDA LEER DIRECTAMENTE LOS DATOS 
-- SE TIENEN DOS FORMAS CON FORMATO LIBRE O FORMATO FIJO 
/* FORMATO LIBRE (EL DELIMITADOR EN LOS DATOS DEBE DE SER UN ESPACIO)*/
DATA RUTA3.CERVEZA_COL;
INPUT MARCA$ ORIGEN$ PRECIO;
CARDS; -- ESTA SENTENCIA AYUDA A DEFINIR QUE LO QUE ESTE DESPUES DE ESE PUNTO Y COMA SON LOS DATOS QUE SE GUSRDAN EN LA TABLA
POKER BOYACA 4500
AGUILA BOYACA 4500
CLUB CUNDINAMARCA 10000
;
RUN;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* FORMATO FIJO(EL FORMATO FIJO, FIJA LA CANTIDAD DE CARACTERES SI UNA PALABRA NO TIENE LA MISMA CANTIDAD QUE EL MAXIMI ESTE TO SE DEBE RELLENAR CON ESPACION)*/
DATA RUTA4.CERVEZA_INTER;
INPUT MARCA$ 1-9 ORIGEN$ 10-20 PRECIO 21-27; -- LOS NUMEROS 1-9 , 10-20 , 21-27 SON LOS LIMMITES DE LA CANTIDAD DE CARACTERES QUE DEBE TENER EL CAMPO
CARDS;
ESTRELLAG ESPAÑA     45.00
CORONA    MEXICO     45.00
BUMBERTH  INGLATERRA 100.00
;
RUN;

