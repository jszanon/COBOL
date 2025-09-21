**** Purpose: Mostrar comandos COBOL (Instrução STRING - Para utilizar o comando STRING temos que tem um identificador, uma literal ou uma variável
e carregar (INTO) com alguma informação).


IDENTIFICATION DIVISION.
PROGRAM-ID. CMSTRING.
DATA DIVISION.
WORKING-STORAGE SECTION.
77 WS-CONTEUDO                  PIC X(30) VALUE SPACES.
77 WS-TEXTO                     PIC X(40) VALUE SPACES.
77 WS-PONTEIRO                  PIC 9(02) VALUE ZEROS.
PROCEDURE DIVISION.
******************** FORMA 1 ********************
    INITIALISE WS-CONTEUDO
               WS-TEXTO
    STRING 
        'JESSICA'
        ' '
        'ZANON'
        DELIMITED BY SIZE INTO WS-CONTEUDO
    END-STRING
    DISPLAY WS-CONTEUDO 
    
******************** FORMA 2 ********************    
    INITIALISE WS-CONTEUDO
               WS-TEXTO
    MOVE 'A JESSICA ESTA ESTUDANDO COBOL' TO WS-TEXTO 
    STRING
        WS-TEXTO(1:9)
        WS-TEXTO(15:22)
        DELIMITED BY SIZE INTO WS-CONTEUDO
    END-STRING
    DISPLAY WS-CONTEUDO 
    
******************** FORMA 3 ********************    
    INITIALISE WS-CONTEUDO
               WS-TEXTO
    MOVE 'A JESSICA ESTA ESTUDANDO COBOL' TO WS-TEXTO
    STRING
        WS-TEXTO(1:09)
        WS-TEXTO(15:22)
        DELIMITED BY 'SPACE' INTO WS-CONTEUDO
    END-STRING
    DISPLAY WS-CONTEUDO
    
******************** FORMA 4 ********************    
    INITIALISE WS-CONTEUDO
               WS-TEXTO
    MOVE 'A JESSICA ESTA ESTUDANDO COBOL' TO WS-TEXTO
    STRING
        WS-TEXTO
        DELIMITED BY 'I' INTO WS-CONTEUDO
    END-STRING
    DISPLAY WS-CONTEUDO
******************** FORMA 5 ********************    
    INITIALISE WS-CONTEUDO
               WS-TEXTO
    MOVE 'A         ESTA ESTUDANDO COBOL' TO WS-TEXTO
    SET WS-PONTEIRO                       TO 3
    STRING
        'JESSICA'
        WS-TEXTO
        DELIMITED BY SIZE INTO WS-TEXTO
        WITH POINTER WS-PONTEIRO
    END-STRING
    DISPLAY WS-TEXTO
STOP RUN.
