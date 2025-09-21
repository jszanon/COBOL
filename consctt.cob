**** Purpose: Consultar contatos

IDENTIFICATION DIVISION.
PROGRAM-ID. CONSCTT.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES.
    DECIMAL-POINT IS COMMA.
    
    INPUT-OUTPUT SECTION.
    FILE-CONTROL.
        SELECT CONTATOS ASSIGN TO 
        'C:\CursoCOBOL\COBOL\01 - Basico\bin\CONTATOS.DAT'
        ORGANISATION IS INDEXED
        ACCESS  MODE IS RANDOM
        RECORD  KEY  IS ID-CONTATO
        FILE STATUS IS WS-FS.

DATA DIVISION.
FILE SECTION.
FD CONTATOS. 
   01 REG-CONTATOS.
      03 ID-CONTATO         PIC 99.
      03 NM-CONTATO         PIC X(20).
WORKING-STORAGE SECTION.
01 WS-REGISTRO              PIC X(22) VALUE SPACES.
01 FILLER REDEFINES WS-REGISTRO.
   03 WS-ID-CONTATO         PIC 9(02).
   03 WS-NM-CONTATO         PIC X(20).
77 WS-FS                    PIC 99.
   88 FS-OK                 VALUE 0.
77 WS-EOF                   PIC X.
   88 EOF-OK                VALUE 'S' FALSE 'N'.
77 WS-EXIT                  PIC X.     
   88 EXIT-OK               VALUE 'F' FALSE 'N'.
PROCEDURE DIVISION.
    DISPLAY '*** CONSULTA DE CONTATOS ***' 
    SET EXIT-OK                 TO FALSE
    PERFORM P300-CONSULTA       THRU    P300-FIM UNTIL EXIT-OK
    PERFORM P900-FIM
    .
P300-CONSULTA.
     SET EOF-OK                 TO FALSE
     SET FS-OK                  TO TRUE
  
     OPEN INPUT CONTATOS 
     
     IF FS-OK THEN 
        DISPLAY 'Informe o numero de identificacao do contato: '
        ACCEPT ID-CONTATO
        
        READ CONTATOS INTO WS-REGISTRO
             KEY IS ID-CONTATO
             INVALID KEY
                DISPLAY 'CONTATO NAO EXISTE!'
             NOT INVALID KEY    
                DISPLAY WS-ID-CONTATO ' - ' WS-NM-CONTATO
        END-READ
     ELSE
        DISPLAY 'ERRO AO ABRIR O ARQUIVO DE CONTATOS.'
        DISPLAY 'FILE STATUS: ' WS-FS
     END-IF
     
     CLOSE CONTATOS
     
     DISPLAY 
      'TECLE: '
      '<QUALQUER TECLA> para continuar, ou <F> para finalizar.'
      ACCEPT WS-EXIT
     .
P300-FIM.
P900-FIM.
STOP RUN.
Informe o numero de identificacao do contato:
7
CONTATO NAO EXISTE!
TECLE: <QUALQUER TECLA> para continuar, ou <F> para finalizar.
F
