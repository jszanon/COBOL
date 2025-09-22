**** Purpose: Mostrar comandos COBOL (LENGTH - Esse comando serve para medir o comprimento de um grupo de dados de uma variável, ou de um grupo
de variáveis que tem vários subitens. Esse comando serve para te dar uma métrica do tamanho que um grupo de itens de variáveis ou de um layout de 
arquivos, por exemplo, e você vai saber metrificar aquilo para poder ser preventivo em relação ao espaço que você vai ocupar). 

IDENTIFICATION DIVISION.
PROGRAM-ID. LENGTH1.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 WS-ENDERECO.
	03 WS-RUA 						PIC X(20).
	03 WS-BAIRRO					PIC X(20).
	03 WS-CIDADE					PIC X(30).
PROCEDURE DIVISION.

	DISPLAY 'O COMPRIMENTO DO GRUPO ENDERECO EH:  '
						      LENGTH OF WS-ENDERECO
STOP RUN.

CONSOLE: 
O COMPRIMENTO DO GRUPO ENDERECO EH:  70




Existe outra forma que pode ser capturado o endereço, se você estiver, por exemplo, trabalhando com cargas de arquivos de layouts:

IDENTIFICATION DIVISION.
PROGRAM-ID. LENGTH2.
DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
77 WS-COMPRIMENTO				PIC 99 VALUE 0.
01 WS-ENDERECO.
	03 WS-RUA 						PIC X(20).
	03 WS-BAIRRO					PIC X(20).
	03 WS-CIDADE					PIC X(30).
PROCEDURE DIVISION.

	COMPUTE WS-COMPRIMENTO  =  FUNCTION LENGTH (WS-ENDERECO)	

	DISPLAY 'OUTRA FORMA:  ' WS-COMPRIMENTO
	.
STOP RUN.
