   ECHO OFF
   CLS
   ECHO 
   ECHO ษอออออออออออออออออออออออออออออออออออออออออออออออออป   
   ECHO บ           O L I M P I C A  S . A                บ  
   ECHO บ  Procedimiento de Ejecuci•n del Segundo Cierre  บ
   ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออออผ  
   ECHO .
   ECHO . NOTA: Este procedimiento suministra los reportes con
   ECHO .       la siguiente informaci•n y debe efectuarse antes
   ECHO .       de aplicar las novedades diarias:
   ECHO .
   ECHO .       1-Genera archivo NUEVO para SERFINANSA
   ECHO .       2-Genera archivo de movimientos por ventas
   ECHO .       3-Listado de Contabilidad por operador
   ECHO .       4-Listado de medios de pago
   ECHO .       5-Listado de relaciขn de cheques
   ECHO .       6-Listado de relaciขn de tarjetas
   ECHO .       7-Listado de Rebajas y Ventas Netas
   ECHO .       8-Listado de ventas por departamento
   ECHO .       9-Copias Diarias de Seguridad     
   ECHO .
   ECHO ษอออออออออออออออออออออออออออออออออออออออออออออออป   
   ECHO บ  PRESIONE CUALQUIER TECLA PARA CONTINUAR...   บ  
   ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออผ  
   PAUSAO
   CLS
   ECHO                  ษออออออออออออออออออออออออออออออออออออออออป
   ECHO                  บ  GENERA ARCHIVO PARA SERFINANSA NUEVO  บ
   ECHO                  ศออออออออออออออออออออออออออออออออออออออออผ

   !---------------------------------------------------------------
   ! Se quita la opcion de borrar los archivos CC desde aca
   ! puesto que este borrado se hara desde la checkout support
   !---------------------------------------------------------------
REM  DEL C:\ADX_IOSS\CC1
REM  DEL C:\ADX_IOSS\CC2
REM  DEL C:\ADX_IOSS\CC3
REM  DEL C:\ADX_IOSS\CC4
REM  DEL C:\ADX_IOSS\CCR 
   !---------------------------------------------------------------

   PLANOCRO 
   ECHO OFF
   CLS
   ECHO .
   ECHO .            ษออออออออออออออออออออออออออออออออออออออออป
   ECHO .            บ      PROCEDIMIENTO DE CIERRE 2         บ
   ECHO .            บ  GENERANDO ARCHIVO DE VENTAS Inegmmdd  บ
   ECHO .            ศออออออออออออออออออออออออออออออออออออออออผ
   PAUSAO
   CREAMOV
   ECHO .................................................................
   ECHO .              Genera Archivos de Medios de Pago
   ECHO .................................................................
   ECHO .      Copia Pagos del Perกodo en PAGOS. Restaura EAMPAGOS(Keyed)
   ECHO .................................................................
   COPY EAMPAGOS PAGOS
   SETPAGOS
rem   PAUSAO
   RRDMEDPA
   ECHO  *******  COMBINANDO ARCHIVOS DE COMPRAS Y PAGOS  *******
   ECHO  *******            PARA SERFINANSA               *******
   ECHO  
rem   PAUSAO
   COPY PAGCOM.DAT + COMP.DAT
:PASO1
   CLS
   ECHO ...
   ECHO .            ษออออออออออออออออออออออออออออออออออออป
   ECHO .            บ  GENERANDO ARCHIVO DE SERFINANSA   บ
   ECHO .            ศออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
   GENCO1
rem   BATCH COPIA
   ECHO ... 
:BIEN1
   ECHO ...
   CLS
   ECHO .     *******************************************************
   ECHO .     ***   PROCEDIMIENTO DE GENERACION DE LOS ARCHIVOS   ***
   ECHO .     ***  MEDPAG1.DAT Y MEDPAG2.DAT A PARTIR DEL MED.DAT ***
   ECHO .     *******************************************************
   ECHO .         Clasifica el archivo MED.DAT por operador
   PRINT PAG
   BATCH ORDENA
rem   PAUSAO
:PASO4
   CLS
rem   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
rem   ECHO  บ    EMITIENDO REPORTE DE CONTABILIDAD POR OPERADOR Y CONTABILIDAD   บ   
rem   ECHO  บ                 CONSOLIDADA DEL NEGOCIO                            บ
rem   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
rem   RRDCONOP
rem   PRINT ADX_IOSS:CC1
rem   PRINT ADX_IOSS:CC2
   CLS
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ    EMITIENDO REPORTE DE MEDIOS DE PAGO POR OPERADOR...   บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
rem   LMEDPAG
   CLS
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ    EMITIENDO REPORTE RELACION DE CHEQUES - 2 COPIAS      บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
   LRELCHQ
   ECHO ...
   CLS
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   EMITIENDO REPORTE DE RELACION DE TARJETAS DE CREDITO ....   บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
rem   LRELTARJ
   ECHO ...
   ECHO Clasifica el archivo C:VEND1.DAT por vendedor
   ECHO ...
   SORT <C:VEND1.DAT> C:VENDOR.DAT
   ECHO ...
   ECHO Lista el movimiento de los vendedores
   ECHO ...
   VENREPOR 1
   ECHO ...
   ECHO Clasifica el archivo C:REB.DAT 
   ECHO ...
REM   COPY C:REB.DAT C:REBOR.DAT
   ECHO ...
   CLS
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   EMITIENDO REPORTE DE REBAJAS Y VENTAS NETAS      บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
   ECHO ...
rem   RRDREBAJ
rem   PRINT ADX_IOSS:CCR
rem   ECHO ...
rem   ECHO Genera archivo de valores brutos por departamento
rem   ECHO ...
rem   DEPARTA
rem   ECHO ...
rem   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออออป
rem   ECHO  บ  EMITIENDO REPORTE DE VENTAS POR DEPARTAMENTO   บ
rem   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   ECHO ...
rem   PAUSAO
rem   RRDEPART
rem   PRINT ADX_IOSS:CC3
rem   PRINT ADX_IOSS:CC4
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ  EMITIENDO REPORTE DE MINIPAGARES C.R.O.  Y A.L.P  บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem   PAUSAO
rem   LMINIP2
rem   LMINIP2
   LMINIP2 
   CLS
   REN02
   BATCH RESPALDO
   CLS
   ECHO                  ษออออออออออออออออออออออออออออออออออออออออป
   ECHO                  บ  GENERANDO ARCHIVO DE SEG. CONTRA ACCIDบ
   ECHO                  ศออออออออออออออออออออออออออออออออออออออออผ
   LOGTXPLU
   ECHO                  ษออออออออออออออออออออออออออออออออออออออออป
   ECHO                  บ  PRESIONE UNA TECLA PARA CONTINUAR...  บ
   ECHO                  ศออออออออออออออออออออออออออออออออออออออออผ
   ADX_UDT1:
   CLS
   ECHO ...
   ECHO .                COMPRIMIENDO ARCHIVOS...
   ECHO ...
   IF EXIST ADX_UDT1:VRCUSTA DEL ADX_UDT1:VRCUSTA
   IF EXIST ADX_UDT1:VRTENDV DEL ADX_UDT1:VRTENDV
   IF EXIST ADX_UDT1:VRITEMR DEL ADX_UDT1:VRITEMR
   IF EXIST ADX_UDT1:VRNOMCR DEL ADX_UDT1:VRNOMCR
   IF EXIST ADX_UDT1:VRMOVO  DEL ADX_UDT1:VRMOVO
   ADXNSXZL C VRCUSTA ADX_IDT4:EAMCUSTA.DAT
   ADXNSXZL C VRTENDV ADX_IDT1:EAMTENDV.DAT
   ADXNSXZL C VRITEMR ADX_IDT1:EAMITEMR.DAT
   ADXNSXZL C VRNOMCR ADX_UDT1:EAMNOMCR.DAT
   ADXNSXZL C VRMOVO  ADX_IDT4:EAMIMOVO.DAT
   ECHO ...
   ECHO .                DISTRIBUYENDO ARCHIVOS...
   ECHO ...
   ADXCSU0L 3 4 VRCUSTA 
   ADXCSU0L 3 4 VRTENDV
   ADXCSU0L 3 4 VRITEMR 
   ADXCSU0L 3 4 VRNOMCR
   ADXCSU0L 3 4 VRMOVO  
rem PAUSAO
   CIESCAP1
   CLS
   ECHO                  ษออออออออออออออออออออออออออออออออออออออออป
   ECHO                  บ  EMITIENDO REPORTE DE AJUSTE AL CAMBIO.บ
   ECHO                  ศออออออออออออออออออออออออออออออออออออออออผ
   LISXDSCT
   CLS
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ    EMITIENDO REPORTE DE CONTABILIDAD POR OPERADOR Y CONTABILIDAD   บ   
   ECHO  บ                   CONSOLIDADA DEL NEGOCIO                          บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC1
rem PRINT ADX_IOSS:BL 
rem   PRINT ADX_IOSS:CC1
rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC1
rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC2 
   ECHO ...
   CLS
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   EMITIENDO REPORTE DE VENTAS NETAS POR DEPARTAMENTO  บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...
rem   PRINT ADX_IOSS:CC3
rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC3
rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC3
   ECHO ...
   CLS
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   EMITIENDO REPORTE DE RELACION DE REBAJAS    บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...
rem PRINT ADX_IOSS:BL
   PRINT ADX_IOSS:CCR
   ECHO ...
   CLS
   ECHO  ษออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   EMITIENDO REPORTE DE NUMERACION FISCAL POS   บ
   ECHO  ศออออออออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...
 rem PRINT ADX_IOSS:BL
   PRINT ADX_IOSS:CC4
 rem PRINT ADX_IOSS:BL
rem   PRINT ADX_IOSS:CC4 
   ADX_UPGM:
   CLS
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ   INDEXANDO ARCHIVOS COPIA DE SEGURIDAD   บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...
   BACKOPER
   OPERADAT
   COPY C:\NOVCONTR.FTP C:\NOVCONTR.DAT
REM   EQUIVAL1
   CLS
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ  EL SEGUNDO CIERRE HA FINALIZADO, POR FAVOR RETIRE LISTADOS     บ
   ECHO  บ               Y ENTREGUELOS EN TESORERIA ...                    บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...
   ECHO  ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
   ECHO  บ       EL SISTEMA PROCEDE A BORRAR LOS ARCHIVOS DE TRABAJO       บ
   ECHO  บ    SI EXISTIO ALGUN INCONVENIENTE, SUSPENDA Y BUSQUE ASESORIA   บ
   ECHO  ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   ECHO ...      
   ECHO              ษออออออออออออออออออออออออออออออออออออออออป
   ECHO              บ  PRESIONE UNA TECLA PARA CONTINUAR...  บ
   ECHO              ศออออออออออออออออออออออออออออออออออออออออผ
   PAUSAO
   ECHO ...  Borrando archivos de trabajo
   ECHO ...
   IF EXIST MED.DAT DEL MED.DAT
   IF EXIST MEDPAG.DAT DEL MEDPAG.DAT
   IF EXIST ME.DAT DEL ME.DAT
   IF EXIST MEDPAG1.DAT DEL MEDPAG1.DAT
   IF EXIST MEDPAG2.DAT DEL MEDPAG2.DAT
   IF EXIST COMP.DAT DEL COMP.DAT
   IF EXIST PG.DAT DEL PG.DAT
   IF EXIST C:VENDOR.DAT DEL C:VENDOR.DAT
   IF EXIST C:VEND1.DAT DEL C:VEND1.DAT
   IF EXIST ADX_UDT1:DEPARTA.DAT DEL ADX_UDT1:DEPARTA.DAT
   IF EXIST ADX_UPGM:I093???? DEL ADX_UPGM:I093????
   ECHO ...
   ECHO ......   FIN DEL CIERRE DIARIO ....
   ECHO ...
   BATCH MEN005.BAT
