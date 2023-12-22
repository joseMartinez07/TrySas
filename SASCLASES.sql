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
