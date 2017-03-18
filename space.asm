;Nome: Leonardo Pedro Da Silva De Sousa
.model small

.stack 100h

.data
	space 	db 'SPACE'
	spaceFim db '$'
	invaders db 'INVADERS'
	invadersFim db '$'
	
	jogar 	db 'Jogar'
	jogarFim db '$'	
	scores 	db 'Recordes'
	scoresFim db '$'
	sair db 'Sair'
	sairFim db '$'
	
	gameOver 	db 'Game Over'
	gameOverFim db '$'	

	
	score db 'score'
	scoreFim db '$'
	lives db 'lives'
	livesFim db '$'
	endVideo EQU 0a000h 							; Endereco inicial do Video
	tamanhoNave dw 0a0fh 							; Tamanho da figura nave
	tamanhoTiro dw 0501h
	velocidadeAlien dw 0004h
	direcaoAlien dw 0000h
	ultimoMovimento dw 0000h
	mascara dw 8016h
	mascaraN dw 0101h
	;---------------------------------------- FIGURAS --------------------------------------------;
	str_null	  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx	
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	;xxxxxxxxxxxxxxx
				  
	str_alien_6   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0			;               
				  db 0,0ah,0ah,0,0,0,0,0,0,0,0,0,2,0ah,0	;  2         2  
				  db 0,0,2,0ah,0,0,0,0,0,0,0,2,0ah,0,0		;   2       2   
				  db 0,0,2,2,0,0,0,0,0,0,0,2,2,0,0			;   2       2   
				  db 0,0,2,2,2,2,2,2,0ah,0ah,0ah,2,0ah,0,0	;  22222222222  
				  db 0,2,2,2,0,2,2,2,2,2,0,2,0ah,0ah,0  	; 222 22222 222 
				  db 2,0,2,2,0,2,2,2,2,2,0,2,0ah,0,0ah		;2 22 22222 22 2
				  db 2,0,2,2,2,2,2,2,2,2,2,0ah,2,0,0ah		;2 22222222222 2
				  db 2,0,2,0,0,0,0,0,0,0,0,0,2,0,0ah		;2 2         2 2
				  db 0,0,0,2,2,2,0,0,0,2,2,2,0,0,0			;   222   222   
	
	str_alien_5   db 0,0,0,0,4,4,4,4,4,4,4,0,0,0,0		;    xxxxxxx    
				  db 0,0,0,4,4,4,4,4,4,0ch,0ch,4,0,0,0	;   xxxxxxxxx   
				  db 0,0,4,4,4,4,4,4,4,4,4,0ch,4,0,0	;  xxxxxxxxxxx  
				  db 0,4,4,4,4,4,4,4,4,4,4,4,0ch,4,0	; xxxxxxxxxxxxx 
				  db 4,4,4,0,4,4,4,4,4,4,4,0,4,0ch,4	;xxx xxxxxxx xxx
				  db 4,4,4,4,4,4,4,4,4,4,4,4,0ch,0ch,4  ;xxxxxxxxxxxxxxx
				  db 0,4,0,4,4,4,4,4,4,0ch,0ch,4,0,4,0	; x xxxxxxxxx x 
				  db 4,0,0,0,0,0,0,0,0,0,0,0,0,0,4		;x             x
				  db 0,4,0,0,0,0,0,0,0,0,0,0,0,4,0		; x           x 
				  db 0,0,4,0,0,0,0,0,0,0,0,0,4,0,0		;  x         x  	
	
	str_alien_4   db 0,0,0,3,3,0,0,0,0,0,3,0bh,0,0,0			;               
				  db 0,0,0,0,3,3,0,0,0,3,0bh,0,0,0,0			;     x   x     
				  db 0,0,0,0,0,3,3,0,3,3,0,0,0,0,0			;      x x      
				  db 0,0,0,3,3,3,3,3,0bh,0bh,0bh,3,0,0,0	;   xxxxxxxxx   
				  db 0,0,3,3,3,3,3,3,3,3,3,0bh,3,0,0		;  xxxxxxxxxxx  
				  db 0,3,3,3,0,3,3,3,3,3,0,3,0bh,3,0		; xxx xxxxx xxx 
				  db 3,0,3,3,3,3,3,3,3,3,3,0bh,3,0,3		;x xxxxxxxxxxx x
				  db 3,0,0,3,3,3,3,3,3,0bh,0bh,3,0,0,3		;x  xxxxxxxxx  x
				  db 0,0,0,0,3,0,0,0,0,0,3,0,0,0,0			;    x     x    
				  db 0,0,3,3,0,0,0,0,0,0,0,3,0bh,0,0		;  xx       xx  
	
	str_alien_3   db 0,0,0,0,0,5,0,0,0,5,0,0,0,0,0			;     x   x     
				  db 0,0,0,0,0,0,5,0,5,0,0,0,0,0,0			;      x x      
				  db 0,5,5,5,5,5,5,5,5,5,5,5,0dh,0dh,0		; xxxxxxxxxxxxx 
				  db 5,5,5,0,0,5,5,5,5,5,0,0,5,0dh,0dh		;xxx  xxxxx  xxx
				  db 5,5,5,5,5,5,5,5,5,5,5,5,5,0dh,0dh		;xxxxxxxxxxxxxxx
				  db 5,5,5,5,5,5,5,5,5,5,5,5,5,0dh,0dh		;xxxxxxxxxxxxxxx
				  db 0,5,5,5,5,5,5,5,5,5,0dh,0dh,0dh,0dh,0	; xxxxxxxxxxxxx 
				  db 0,0,0,0,5,0,0,5,0,0,5,0,0,0,0			;    x  x  x    
				  db 0,0,0,5,0,5,5,0,5,5,0,5,0,0,0			;   x xx xx x   
				  db 0,5,5,0,0,0,0,5,0,0,0,0,5,0dh,0		; xx    x    xx 
	
	str_alien_2   db 0,0,0,0eh,0eh,0,0,0,0,0,0eh,0eh,0,0,0		;    x     x    
				  db 0,0,0,0,6,0eh,0,0,0,6,0eh,0,0,0,0			;     x   x     
				  db 0,0,0,0,0,6,6,0,6,6,0,0,0,0,0				;      x x      
				  db 0,0,6,6,6,6,6,0eh,0eh,0eh,0eh,0eh,6,0,0	;  xxxxxxxxxxx  
				  db 0,6,6,6,6,6,6,6,6,6,6,6,0eh,6,0			; xxxxxxxxxxxxx 
				  db 6,6,6,0,0,6,6,6,6,6,0,0,6,0eh,6			;xxx  xxxxx  xxx
				  db 0,6,6,6,6,6,6,6,6,6,6,6,0eh,6,0			; xxxxxxxxxxxxx 
				  db 0,0,6,6,6,6,6,6,6,6,6,6,6,0,0				;  xxxxxxxxxxx  
				  db 0,0,0,0,6,0,0,6,0,0,6,0,0,0,0				;    x  x  x    
				  db 0,0,0,6,0,0,0,0,0,0,0,6,0,0,0				;   x       x   	
				  
	str_alien_1   db 0,0,0,0,0,1,1,1,1,1,0,0,0,0,0	;     xxxxx     	
				  db 0,0,0,0,1,1,1,1,9,9,1,0,0,0,0	;    xxxxxxx    
				  db 0,0,0,1,1,1,1,1,1,1,9,1,0,0,0	;   xxxxxxxxx   
				  db 0,0,1,1,1,1,1,1,1,1,1,9,1,0,0	;  xxxxxxxxxxx  
				  db 0,1,1,1,0,1,1,1,1,1,0,1,9,1,0	; xxx xxxxx xxx 
				  db 1,1,1,1,1,1,1,1,1,1,1,1,1,9,1	;xxxxxxxxxxxxxxx
				  db 0,1,1,1,1,1,1,1,1,1,1,1,9,1,0	; xxxxxxxxxxxxx 
				  db 0,0,1,1,0,0,1,0,1,0,0,1,9,0,0	;   x  x x  x   
				  db 0,1,1,0,0,1,0,0,0,1,0,0,1,9,0	;  x  x   x  x  
				  db 1,1,0,0,1,0,0,0,0,0,9,0,0,1,9	; x  x     x  x 
	
	str_falcon	  db 00h,00h,00h,00h,00h,00h,00h,0ah,00h,00h,00h,00h,00h,00h,00h	;               
				  db 00h,00h,00h,00h,00h,00h,02h,0ah,0ah,00h,00h,00h,00h,00h,00h	;  2         2  
				  db 00h,00h,00h,00h,00h,00h,02h,0ah,0ah,00h,00h,00h,00h,00h,00h	;   2       2   
				  db 00h,00h,00h,00h,00h,00h,02h,0ah,0ah,00h,00h,00h,00h,00h,00h	;   2       2   
				  db 00h,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,00h	;  22222222222  
				  db 02h,02h,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,02h,02h,02h,02h,0ah	; 222 22222 222 
				  db 02h,02h,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,02h,02h,0ah	;2 22 22222 22 2
				  db 02h,02h,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,0ah,02h,0ah	;2 22222222222 2
				  db 02h,02h,02h,02h,02h,02h,02h,02h,0ah,0ah,0ah,0ah,0ah,0ah,0ah	;2 2         2 2
				  db 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0ah,0ah,0ah,0ah,0ah	;   222   222   		  
	str_tiro 	  db 0fh    ; x
				  db 0fh    ; x
				  db 0fh    ; x
				  db 0fh    ; x
				  db 0fh    ; x
	
	;quantidade, distancia, linha, coluna
	linha_1 dw 000ah, 000ah, 0010h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	linha_2 dw 000ah, 000ah, 0020h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	linha_3 dw 000ah, 000ah, 0030h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	linha_4 dw 000ah, 000ah, 0040h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	linha_5 dw 000ah, 000ah, 0050h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	linha_6 dw 000ah, 000ah, 0060h, 0028h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
	
	;vidas, pontos, linha, coluna
	millenium_falcon dw 0003h, 0000h, 00bah, 00000h
	;linha, coluna, ativo
	tiroHeroi dw 00b0h, 0000h, 0000h, 0001h
	tiroAlien dw 0000h, 0000h, 0000h, 0000h
	ultimoMovimentoTiro dw 0000h
	menorAlien dw 0001h
	maiorAlien dw 000ah
	charScore db 00h,0ah
.code
	

	DESENHA_P proc
		;ax = linha
		;bx = coluna
		;ch = altura da string(figura)
		;cl = largura da string(largura)
		;dx = endereco inicial da string(figura)
			
		;push ax			;empilha posicao destino da figura
		push es si di dx cx bx ax
		
		mov si, cx
		mov cx, ds:[si]
		
		
		mov si, dx		;move pro SI onde fica a figura
		;mov dx, ax
		mov dx, 140h	;move pro DX 140, largura tela
		mul dx			;multiplica por 140
		
		;pop bx			;desimpilha posicao figura
		;mov bl, 00h		;zera a parte menos significativa bx
		add ax, bx		;soma com a coluna destino
		mov di, ax		;move para o DI o destino
		mov ax, endVideo ;move para o AX o endereco inicial do video
		mov es, ax		;move para o ES o endereco de AX = & do video
		mov dx, cx		;copia para o dx o valor do ch
		mov cl, ch		;passa para a parte menos significativa o contador
		mov ch, 00h		;da altura de c e zera a mais significativa
		
	DESENHA_P_LACO:
		push cx				;empilha o cx
		mov cl, dl			;copia para o cl o tamanho da largura
		cld					;limpa
		rep movsb			;copia string(figura)
		add di, 0140h		;soma para pular para a linha seguinte
		mov ax, 0000h		;zera ax
		mov al, dl			;move para al a largura da figura
		sub di, ax			;subtrai do destino o ax = tamanho da largura
		pop cx				;desimpilha o cx para o laço externo
		LOOP DESENHA_P_LACO	;fim do laço
		
		pop ax bx cx dx di si es
		ret
	endp

	LINHA proc
		;ax = offset da figura
		;bx = endereco da linha
		;Conteudo Linha => quantidade, distancia, linha, coluna, 10x, informando se ta morto = 0ffffh
		push si di bp dx cx bx ax
		
		mov bp, bx				;BP tem a base da linha
		mov dx, ax				;DX possui o offset da figura
		
		mov cx, ds:[bp]			;CX possui a quantidade
		mov di, ds:[bp + 02h]	;DI possui a distancia entre os aliens
		mov ax, ds:[bp + 04h]	;AX possui a linha 	Inicial
		mov bx, ds:[bp + 06h]	;BX possui a coluna Inicial
		mov si, 08h				;SI possui o indice Inicial dos indicadores se esta morto ou vivo
		
	LINHA_LACO:
		push cx						;Empilha o reg de controle
		
		mov cx, offset tamanhoNave	; Carrega CX com offset das dimensões do alien
		push dx						; Empilha DX
		mov dx, ds:[bp + si]		; Carrega DX com byte duplo se esta ligado
		cmp dx, 0ffffh				; Compara se o valor é de alien morto
		pop dx						; Desempilha DX
		je LINHA_MORTO				; Desvio Condicional caso o mesmo esteja morto
		call DESENHA_P				; Desenha o Alien
		jmp LINHA_C					; Desvio Condicional caso o mesmo esteja morto
	LINHA_MORTO:
		push dx
		mov dx, offset str_null
		call DESENHA_P				; Desenha o Alien
		pop dx
	LINHA_C:
		mov ch, 00h					;Zera parte alta de CH
		add bx, 0fh					;Adiciona BX o tamanho do alien
		add bx, di					;Adiciona com a distancia
		add si, 02h					;Incrementa 2 no SI
		pop cx						;Desempilha o reg de controle
		LOOP LINHA_LACO
		
		pop ax bx cx dx bp di si
	ret
	endp
	
	DESENHA_LINHA proc
		push cx bx ax
		mov cx, 06h
		mov ax, offset str_alien_6
		mov bx, offset linha_1
	DESENHA_LINHA_LACO:
		call LINHA                  ;Desenha a linha
		add bx, 1ch
		add ax, 96h
		LOOP DESENHA_LINHA_LACO
		pop ax bx cx
		ret
	endp
	
	DESENHA_HEROI proc
		push cx bx ax
		
		mov bx, offset millenium_falcon
		mov ax, ds:[bx + 04h]
		mov bx, ds:[bx + 06h]
		;push bx
		;mov bx, offset tamanhoNave
		mov cx, offset tamanhoNave
		;pop bx
		;mov dx, offset  str_falcon
		call DESENHA_P		
		pop ax bx cx
		ret
	endp
	
	ESCREVE_NUMERO proc
		;AX = numero
		;DX = linha/coluna
		push ax bx cx dx bp es si
		mov si, dx
		mov bx, 0ah
		mov cx, 00h
	EN_TEM_NUMERO:
		mov dx, 00h
		div bx
		
		push dx
		inc cx
		
		cmp ax, 00h
		jnz EN_TEM_NUMERO
		
	EN_ESCREVE:
		
		pop dx
		add dl, '0'
		
		mov dh, 0ah
		;mov dl, 0ah
		mov bp, offset charScore
		mov ds:[bp], dx
		
		mov ax, 1302h
		push cx
		mov cx, 01h
		mov bp, offset charScore
		push ds
		pop es
		mov dx, si
		inc si
		int 10h
		pop cx
		LOOP EN_ESCREVE
		
		pop si es bp dx cx bx ax
		ret
	endp
	
	NUMERO_ALEATORIO proc
		push ax bx cx dx
		;mov bx, offset tiroAlien
		;mov dx, ds:[bx + 04h]
		;cmp dx, 0000h
		;jne NUMERO_ALEATORIO_F
		mov bx, offset mascaraN
		mov dx, ds:[bx]
		or dx, 0fffeh
		cmp dx, 0ffffh
		je NA_BITSETADO
		mov dx, ds:[bx]
		ror dx, 01h
		mov ds:[bx], dx
		jmp NUMERO_ALEATORIO_F
	NA_BITSETADO:			
		mov bx, offset mascaraN
		mov dx, ds:[bx]
		xor dx, 8016h
		ror dx, 01h
		mov bx, offset mascaraN
		mov ds:[bx], dx
	NUMERO_ALEATORIO_F:
		pop dx cx bx ax	
		ret
	endp 
	
	
	PROX_TIRO_ALIEN proc
		push ax bx cx dx si
		;Carregado o maior e menor, onde é tirado a diferenca e somado 1
		mov bx, offset tiroAlien
		mov dx, ds:[bx + 04h]
		cmp dx, 0000h
		jne PTA_FINAL
		
		mov bx, offset maiorAlien;
		mov dx, ds:[bx]
		mov bx, offset menorAlien;
		sub dx, ds:[bx]
		inc dx				;DX tem a quantidade de aliens
		mov cx, dx
		;
		;Carrega o numero aleatorio e realiza a divisao
		call NUMERO_ALEATORIO
		mov bx, offset mascaraN
		mov ax, ds:[bx]
		;mov ah, 00h
		mov dx,0000h
		div cx		;DX contem o nº aleatorio da coluna
		mov ax, dx
		;Percorrer as 6 linhas de aliens de baixo para cima para saber quem atira
		mov bx, offset linha_6
		mov si, dx				;SI fica com o indice
		shl si, 01h				; Multiplicado por 2
		mov cx, 06h				; Registro de controle com 06
	PTA_I:
		push cx
		mov cx, ds:[bx + si + 08h]
		cmp cx, 0ffffh			;Cmp se estao morto
		je PTA_CONTINUE
		;Esta vivo e apto para atirar
		;Primeiramente pegar a linha(X) onde se encontra o alien
		mov cx, ds:[bx + 04h]
		add cx, 0ah				;Adiciona a altura do alien
		push cx
		mov cx, ds:[bx + 06h]
		mov dx, 19h
		;dec ax
		mul dx
		add ax, cx
		add ax, 07h
		
		; Ax esta com a coluna do tiro
		
		mov bx, offset mascaraN
		mov dx, ds:[bx]

		
		mov bx, offset tiroAlien
		mov ds:[bx + 04h], 0ffffh
		mov ds:[bx + 02h], ax
		pop ax
		mov ds:[bx], ax
		pop cx
		jmp PTA_FINAL
	
	
	PTA_CONTINUE:
		pop cx
		sub bx, 1ch
		LOOP PTA_I
	PTA_FINAL:
		pop si dx cx bx ax
		ret
	endp 
	
	MOVIMENTA_TIRO proc
		;BX é carregado com offset tiro
		push bp dx cx bx ax
		
		
		;mov bp, offset ultimoMovimentoTiro
		
		mov ah, 2ch		;2CH obtem o tem atual do sistema
		int 21h			;Pela interrupção do 21h
		
		
		;;--------------------ATRASO DO TIRO
		mov cx, 0ffffh
	MOVIMENTA_TIRO_DI:
		push cx
		mov cx, 0008h
		MOVIMENTA_TIRO_DJ:
		nop
		nop
		nop
		LOOP MOVIMENTA_TIRO_DJ
		pop cx
		LOOP MOVIMENTA_TIRO_DI		
		;;----------------------------------
		
		;mov bx, offset tiroAlien		
		mov dx, ds:[bx + 04h]			;Bx se o tiro esta ativo
		cmp dx, 0000h
		je MOVIMENTA_TIRO_FINAL
		mov ax, ds:[bx]					;AX é carregado com a linha do tiro
		push bx                         ;Empilha BX já que ele será utilizado
		mov bx, ds:[bx + 02h]           ;BX é carregado com a coluna do tiro
		mov cx, offset tamanhoTiro      ;CX é carregado com offset do tamanho da figura do tiro
		mov dx, offset str_null         ;DX é carregado com offset do tamanho da figura do str null
		call DESENHA_P                  ;Chama a proc de desenhar a figura, no caso apagar
		pop bx                          ;Desempilha o bx
		mov dx, ds:[bx + 06h]
		cmp dx, 0000h
	    je MOVIMENTA_TIRO_UP	
		sub ax, 01h
		jmp MOVIMENTA_TIRO_DOWN
	MOVIMENTA_TIRO_UP:
		inc ax                          ;Incrementa o AX
	MOVIMENTA_TIRO_DOWN:
		mov ds:[bx], ax                 ;Guarda na linha do tiro a proxima localização dele
		                                ;
		mov ax, ds:[bx]                 ;Move para ax a linha do tiro
		push bx
		mov bx, ds:[bx + 02h]           ;Move para bx a coluna do tiro
		mov cx, offset tamanhoTiro      ;Move para cx o tamanho do tiro
		mov dx, offset str_tiro         ;Move para dx a string do tiro
		call DESENHA_P                  ;Chama a proc para desenhar o tiro de fato
		pop bx
		mov dx, ds:[bx + 06h]
		cmp dx, 0000h
		je MOVIMENTA_TIRO_LD
		cmp ax, 0010h
		jne MOVIMENTA_TIRO_FINAL
		mov ax, ds:[bx]					;AX é carregado com a linha do tiro
		push bx                         ;Empilha BX já que ele será utilizado
		mov bx, ds:[bx + 02h]           ;BX é carregado com a coluna do tiro
		mov cx, offset tamanhoTiro      ;CX é carregado com offset do tamanho da figura do tiro
		mov dx, offset str_null         ;DX é carregado com offset do tamanho da figura do str null
		call DESENHA_P                  ;Chama a proc de desenhar a figura, no caso apagar
		pop bx
		mov ax, 0000h
		mov ds:[bx + 04h], ax
		mov ds:[bx], ax		
		mov ax, 00C0h
		mov ds:[bx + 02h], ax
		jmp	MOVIMENTA_TIRO_FINAL
	MOVIMENTA_TIRO_LD:
		cmp ax, 0c3h
		jne MOVIMENTA_TIRO_FINAL
		mov ax, ds:[bx]					;AX é carregado com a linha do tiro
		push bx                         ;Empilha BX já que ele será utilizado
		mov bx, ds:[bx + 02h]           ;BX é carregado com a coluna do tiro
		mov cx, offset tamanhoTiro      ;CX é carregado com offset do tamanho da figura do tiro
		mov dx, offset str_null         ;DX é carregado com offset do tamanho da figura do str null
		call DESENHA_P                  ;Chama a proc de desenhar a figura, no caso apagar
		pop bx
		mov ax, 0000h
		mov ds:[bx + 04h], ax
		mov ds:[bx + 02h], ax
		mov ds:[bx], ax

    MOVIMENTA_TIRO_FINAL:
		;mov ah, 01h
		;mov al, 00h
		;int 21h		
		pop ax bx cx dx bp
		ret
	endp 
	
	MOVIMENTA_HEROI proc
		push ax bx cx dx
		mov ah, 01h
		int 16h
		
		jnz MOVIMENTA_HEROI_S
		jmp MOVIMENTA_HEROI_N
	MOVIMENTA_HEROI_S:
		mov dx, offset str_null
		call DESENHA_HEROI
		
		mov ah, 00h
		int 16h
		cmp ah, 4dh
		je MOVIMENTA_HEROI_DIR
		cmp ah, 4bh
		jne MOVIMENTA_HEROI_TIRO
		mov bx, offset millenium_falcon
		mov dx, ds:[bx + 06h] 
		cmp dx, 00h
		je MOVIMENTA_HEROI_N
		sub dx, 05h
		mov ds:[bx + 06h], dx	
		jmp MOVIMENTA_HEROI_N
	MOVIMENTA_HEROI_DIR:
		mov bx, offset millenium_falcon
		mov dx, ds:[bx + 06h] 
		cmp dx, 0130h
		jge MOVIMENTA_HEROI_N
		add dx, 05h
		mov ds:[bx + 06h], dx
	MOVIMENTA_HEROI_TIRO:
		cmp al, 20h							;Atira
		jne MOVIMENTA_HEROI_N
		mov bx, offset millenium_falcon
		mov dx, ds:[bx + 06h]
		add dx, 07h
		
		mov bx, offset tiroHeroi
		mov ds:[bx + 04h], 0ffffh
		mov ds:[bx + 02h], dx
		mov dx, 0b4h
		mov ds:[bx], dx
		
	MOVIMENTA_HEROI_N:	
		mov dx, offset str_falcon
		call DESENHA_HEROI
		pop dx cx bx ax
		ret
	endp
	
	POSICAO_ALIEN_VIVO proc
		;ax retorna o maiorAlien
		;bx retorna o menor
		push si bp dx cx
		mov dx, 01h
		mov bp, 0ah
		mov bx, offset linha_1
		mov cx, 06h
	PSV_LOOP_I:
		push cx
		
		mov si, 02h
		mov cx, 0ah
	PSV_LOOP_J:
		mov ax, ds:[bx + si + 06h]
		cmp ax, 0ffffh
		je  PSV_LOOP_JCNT
		push si
		shr si, 01h
		cmp dx, si
		pop si
		jge PSV_LOOP_MENOR
		push si
		shr si, 01h
		mov dx, si
		pop si
	PSV_LOOP_MENOR:
		push si
		shr si, 01h
		cmp bp, si
		pop si
		jle PSV_LOOP_JCNT
		push si
		shr si, 01h
		mov bp, si
		pop si
	PSV_LOOP_JCNT:	
		add si, 02h
		LOOP PSV_LOOP_J
		add bx, 1ch
		pop cx
		LOOP PSV_LOOP_I
		mov ax, dx
		mov bx, bp
		pop cx dx bp si
		ret
	endp
	
	MUDA_D_L proc
		push ax bx cx dx 
		mov bx, offset direcaoAlien
		mov dx, ds:[bx]
		push dx
		cmp dx, 0001h
		je MUDA_D_L_DEC
		inc dx
		jmp MUDA_D_L_INC
	MUDA_D_L_DEC:
		dec dx
	MUDA_D_L_INC:	
		mov ds:[bx], dx
		mov bx, offset linha_1
		pop ax
		mov cx, 06h
	MDL_LOOP:
		mov dx, 05h
		add ds:[bx + 04h], dx
		cmp ax, 0000h
		je MDL_DIR
		;mov dx, ds:[bx + 06h]
		;push bx
		;mov bx, offset velocidadeAlien
		;mov dx, ds:[bx]
		;pop bx
		;add ds:[bx + 06h], dx
		jmp MDL_ESQ
	MDL_DIR:
		;push bx
		;mov bx, offset velocidadeAlien
		;mov dx, ds:[bx]
		;pop bx
		;sub ds:[bx + 06h], dx
	MDL_ESQ:	
		add bx, 1ch	
		LOOP MDL_LOOP
		pop dx cx bx ax	
		ret
	endp 

	
	NOVA_LINHA proc
		push ax bx cx dx
		
		call POSICAO_ALIEN_VIVO
		push bx
		push ax
		mov bx, 000fh
		mul bx
		pop dx
		push ax
		dec dx
		mov ax, 000ah
		mul dx
		pop bx 
		add ax, bx
		mov bx, offset linha_1
		add ax, ds:[bx + 06h]
		mov cx, ax
		cmp ax, 0140h
		jl NOVA_LINHA_CNT
		call MUDA_D_L
		pop bx
		jmp NOVA_LINHA_F
	NOVA_LINHA_CNT:
		pop ax
		dec ax
		mov dx, 001fh
		mul dx	
		mov bx, offset linha_1
		add ax, ds:[bx + 06h]
		;cmp ax, 0f00h
		jns NOVA_LINHA_F
		call MUDA_D_L
	NOVA_LINHA_F:
		pop dx cx bx ax
		ret
	endp
	
	ALVO_ATINGIDO proc
		push si di bp dx cx bx ax
		
		mov bp, 05h
		mov cx, 06h
		mov bx, offset tiroHeroi
		mov bx, ds:[bx + 04h]
		cmp bx, 0ffffh
		je ALVO_ATINGIDO_CONTINUE
		pop ax bx cx dx bp di si
		ret
	ALVO_ATINGIDO_CONTINUE:	
		
		mov bx, offset linha_1
  	ALV0_ATINGIDO_LA:				; --+
  		push cx                     ;   |
  		mov dx, ds:[bx + 04h]
		push bx
		mov bx, offset tiroHeroi
		mov cx, ds:[bx]
		pop bx
		cmp dx, cx
		jg ALVO_ATINGIDO_PL
		add dx, 0ah
		cmp dx, cx 
		jl ALVO_ATINGIDO_PL
		mov cx, 0ah                 ;   |

		mov ax, ds:[bx + 06h]
		mov si, 08h
  	ALVO_ATINGIDO_LOOP:             ; | Alvo atingido
  		push cx
		push bx
		mov bx, offset tiroHeroi
		mov cx, ds:[bx + 02h]
		pop bx
		cmp ax, cx
		jg ALVO_ATINGIDO_PA1
		add ax, 0fh
		cmp ax, cx
		jl ALVO_ATINGIDO_PA
		
		mov dx, ds:[bx + si]
		cmp dx, 0ffffh
		pop cx
		je ALVO_ATINGIDO_PL
		push cx	
		mov dx, 0ffffh
		mov ds:[bx + si], dx
		;Aumentar os pontos da millenium_falcon
		mov bx, offset millenium_falcon
		push ax
		mov ax, 05h
		mov cx, bp
		shl ax, cl
		add ds:[bx + 02h], ax
		pop ax
				
		mov bx, offset tiroHeroi
		mov dx, 0000h
		mov ds:[bx + 04h], dx
		mov ax, ds:[bx]					;AX é carregado com a linha do tiro
		mov bx, ds:[bx + 02h]           ;BX é carregado com a coluna do tiro
		mov cx, offset tamanhoTiro      ;CX é carregado com offset do tamanho da figura do tiro
		mov dx, offset str_null         ;DX é carregado com offset do tamanho da figura do str null
		call DESENHA_P                  ;Chama a proc de desenhar a figura, no caso apagar		
		pop cx
		pop cx
		jmp ALVO_ATINGIDO_ST
	ALVO_ATINGIDO_PA1:
		add ax, 0fh
	ALVO_ATINGIDO_PA:
		pop cx
		add si, 02h
		add ax, 0ah
  		LOOP ALVO_ATINGIDO_LOOP     ;   |
	ALVO_ATINGIDO_PL:
  		add bx, 1ch                 ;   |
		dec bp
  		pop cx                      ;   |
  		LOOP ALV0_ATINGIDO_LA       ; --+
		
		
	ALVO_ATINGIDO_ST:	
		pop ax bx cx dx bp di si
		ret
	endp
	
	HEROI_ATINGIDO proc
		push ax bx cx dx
		mov bx, offset tiroAlien
		mov dx, ds:[bx + 04h]    
		cmp dx, 0ffffh				;Compara se ele esta vivo
		jne HA_SEM_TIRO
		mov dx,ds:[bx]
		add dx, 0ah
		cmp dx, 0bah
		jl HA_SEM_TIRO
		mov dx, ds:[bx + 02h]
		mov bx, offset millenium_falcon
		mov cx, ds:[bx + 06h]
		cmp dx, cx
		jl HA_SEM_TIRO
		add cx, 0fh
		cmp dx, cx
		jg HA_SEM_TIRO
		
		;Tiro do alienigina acertou o han solo & chew
		mov bx, offset millenium_falcon
		mov ax, ds:[bx + 04h]
		mov bx, ds:[bx + 06h]
		mov cx, offset tamanhoNave
		mov dx, offset str_null
		call DESENHA_P
		
		mov bx, offset tiroAlien
		mov ds:[bx + 04h], 0ffffh
		mov bx, offset millenium_falcon
		
		
		
		mov dx, 01h
		sub ds:[bx], dx
		dec dx
		mov ds:[bx + 06h], dx
		
	HA_SEM_TIRO:	
		pop dx cx bx ax
		ret
	endp
	
	CHUMBO_TROCADO proc
		push ax bx cx dx 
		mov bx, offset tiroHeroi
		mov dx, ds:[bx + 04h]
		cmp dx, 0000h
		je CT_FINAL
		mov bx, offset tiroAlien
		mov dx, ds:[bx + 04h]
		cmp dx, 0000h
		je CT_FINAL
		mov ax, ds:[bx + 02h]
		mov bx, offset tiroHeroi
		mov dx, ds:[bx + 02h]
		cmp ax, dx 
		jne CT_FINAL
		mov dx, ds:[bx]
		mov bx, offset tiroAlien
		mov ax, ds:[bx]
		cmp ax, dx
		jne CT_FINAL
		mov dx, 0000h
		mov ds:[bx + 04h], dx
		mov bx, offset tiroHeroi
		mov ds:[bx + 04h], dx
	CT_FINAL:
		pop dx cx bx ax 
		ret
	endp
	
	
	M_ALIENS proc
		push bp di si dx cx bx ax
		mov bx, offset linha_1		;BX tem o offset da primeira linha
		mov bp, offset str_alien_6	;BP tem o offset da segunda linha
		mov si, 00h					;SI fica com zero
		mov di, 00h					;DI fica com zero
		mov cx, 06h					;CX é carregado com a quantidade de linhas
	M_ALIENS_LOOP:
		push cx						;Empilha CX
		push si
		push di
		
		mov ax, 00h					;AX é carregado com FALSO
		mov cx, ds:[bx + si]
		add si, 08h					;SI começa com o indice dos aliens se estao mortos
	M_ALIENS_LOOP_V:				;LOOP para verificar se existe pelo um alien na linha a ser escrita na tela
		add ax, ds:[bx + si]		;Acuma em AX o valor dos campos de alien mortos
		add si, 02h
		LOOP M_ALIENS_LOOP_V
		
		cmp ax, 0ah					;Compara se todos alien estão mortos
		pop di
		pop si
		je M_ALIEN_LINHA_MORTA		;JUMP condicial para o final do LOOP da linha atual
		
		push bx						;Empilha BX pois o mesmo ser usado para desenhar a linha
		mov ax, offset str_null 	;Enderecoo inicial da figura carregado com AX
		;;;;;;;;;;mov bx, bp		;Endereco inicial da linha carregado com BX
		add bx, si                  ;Indice da figura
		call LINHA  
		
	
		
		call PROX_TIRO_ALIEN
		pop bx
		
		push bx
		mov bx, offset direcaoAlien
		mov dx, ds:[bx]				;DX é carregado com a direção do Alien
		mov bx, offset velocidadeAlien
		mov cx, ds:[bx]				;CX é carregado com a velocidade do Alien
		cmp dx, 01h
		pop bx
		je	M_ALIEN_DIR				;Jump Equal para a direita caso esteja setado		
		sub ds:[bx + si + 06h], cx
		jmp M_ALIEN_LINHA_MORTA
	M_ALIEN_DIR:	
		add ds:[bx + si + 06h], cx
	M_ALIEN_LINHA_MORTA:
		
		add si, 1ch
		add di, 96h
		pop cx						;Desempilha CX
		LOOP M_ALIENS_LOOP
		call NOVA_LINHA
		call DESENHA_LINHA
		pop ax bx cx dx si di bp
	ret
	endp
	
	MOVIMENTACAO proc
		push dx cx bx ax	
		mov ah, 2ch		;2CH obtem o tem atual do sistema
		int 21h			;Pela interrupção do 21h
		push dx
		
		mov bx, offset ultimoMovimento		;Carrega endereco no BX
		mov cx, ds:[bx] 					; CX é carregado no 
		cmp cl, dl							;Parte menos significativa passa para o CL
		jg MOVIMENTACAO_TMP_MAIOR			;Jump condicional 
		sub dl, cl							;Diminui do DL(Possui o tempo atual) o ultimo Tempo registrado
		jmp MOVIMENTACAO_TMP_MENOR			; Jump incondicional para continuação
	MOVIMENTACAO_TMP_MAIOR:
		push bx								;Empilha bx que tem a referencia do ultimo movimento	
		mov bx, 64h							;Coloca o valor máximo do centésimo para tirar a diferenca
		sub bl, cl							;Subtrai de bl o valor para tirar a diferenca
		add bl, dl							;Adiciona BL o restante
		mov dl, bl							;Move para DL o ultimo VALOR
		pop bx								;Desempilha BX
	MOVIMENTACAO_TMP_MENOR:	
		cmp dl, 32h							;Compara com 500ms
		pop dx								;Desempilha tempo atual
		jl MOVIMENTACAO_N_ALIENS			;Pula para nao movimentar ja que nãos e passou 500ms
		call M_ALIENS						;Chama o movimento
		mov ds:[bx], dx						;Guarda o ultimo movimento
	MOVIMENTACAO_N_ALIENS:
		call DESENHA_LINHA
		call MOVIMENTA_HEROI				;Chama a movimentacao do heroi
		pop ax bx cx dx
		ret
	endp
	
	CABECALHO proc
		push ax bx cx dx bp es
		mov ax, 1301h
		mov bh, 0 
		mov bl, 0fh 
		mov cx, scoreFim - offset score			 ;
		mov dl, 00h 
		mov dh, 00h
		push ds
		pop es
		mov bp, offset score 
		int 10h
		
		push bx
		mov bx, offset millenium_falcon
		mov ax, ds:[bx + 02h]
		pop bx
		mov dx, 0005h
		call ESCREVE_NUMERO
		
		
		mov ax, 1301h
		mov bh, 0 
		mov bl, 0fh 
		mov cx, livesFim - offset lives			 ;
		mov dl, 1dh
		mov dh, 00h
		push ds
		pop es
		mov bp, offset lives 
		int 10h
		
		mov bx, offset millenium_falcon
		mov cx, 03h
		mov bx, 100h
	
	CABECALHO_VIDAS:
		push cx
		mov ax, 00h
		add bx, 10h
		mov cx, offset tamanhoNave
		mov dx, offset str_null
		call DESENHA_P
		pop cx
		LOOP CABECALHO_VIDAS
			
		mov bx, offset millenium_falcon
		mov cx, ds:[bx]
		mov bx, 100h
	
	CABECALHO_VIDAS_C:
		push cx
		mov ax, 00h
		add bx, 10h
		mov cx, offset tamanhoNave
		mov dx, offset str_falcon
		call DESENHA_P
		pop cx
		LOOP CABECALHO_VIDAS_C
		
		pop es bp dx cx bx ax
		ret	
	endp
	
	TELA_PONTUACAO proc
		push ax bx cx dx bp es
	TP_LOOP:	
		mov ah, 00h
		mov al, 13h
		int 10h

		push ds
		pop es
		mov ax, 1301h
		mov bh, 0 
		mov bl, 0fh 
		mov cx, gameOverFim - offset gameOver
		mov dl, 10
		mov dh, 6
		mov bp, offset gameOver
		int 10h
		

		mov bx, offset millenium_falcon
		mov ax, ds:[bx + 02h]
		mov dx, 0616h
		call ESCREVE_NUMERO
		
		
		mov ax, 0100h
		int 21h
		cmp al, 13
		jne TP_LOOP
		
		pop es bp dx cx bx ax
		ret
	endp
	
	SET_FALCON proc
		push ax bx cx dx si 
		mov	bx, offset millenium_falcon
		mov dx, 03h
		mov ds:[bx], dx
		mov dx, 0000h
		mov ds:[bx + 02h], dx
		mov ds:[bx + 06h], dx
		
		mov bx, offset linha_1
		mov di, 10h
		mov cx, 06h
	SET_FALCON_LOOP:
		push cx
		mov ds:[bx + 04h], di
		mov dx, 0028h
		mov ds:[bx + 06h], dx
		mov si, 0000h
		mov dx, 0000h
		mov cx, 0ah
	SET_FALCON_LOOP_J:
		mov ds:[bx + si + 08h], dx
		add si, 02h
		LOOP SET_FALCON_LOOP_J
	
		add di, 0010h
		add bx, 1ch
		pop cx
		LOOP SET_FALCON_LOOP
		pop si dx cx bx ax
		ret
	endp
	
	EXISTEM_ALIEN_VIVOS proc
		push ax
		push dx 
		push cx
		push si
		push bx 
		
		mov ax, 0000h
		mov dx, 0000h
		mov cx, 0006h
		mov bx, offset linha_1
		
	LOOP_TEM_VIVO:
		push cx
		mov si, 0000h
		mov cx, 000ah
	LOOP_TEM_VIVO_J:
		mov dx, ds:[bx + si + 08h]
		cmp dx, 0ffffh
		je LOOP_TEM_VIVO_CTE
		inc ax
	LOOP_TEM_VIVO_CTE:
		add si, 02h
		LOOP LOOP_TEM_VIVO_J
		add bx, 1ch
		pop cx
		LOOP LOOP_TEM_VIVO
		
		cmp ax, 0000h
		jne JOGO_EXISTEM_ALIENS
		call SET_FALCON
		mov bx, offset velocidadeAlien
		mov dx, 0001h
		add ds:[bx], dx
	JOGO_EXISTEM_ALIENS:
	
		pop bx
		pop si
		pop cx
		pop dx
		pop ax
		ret
	endp 
	
	JOGO proc
		push dx cx bx ax
		mov dx, offset str_falcon
		call DESENHA_HEROI
		call M_ALIENS
		call CABECALHO
		;call MOVIMENTA_TIRO
		mov cx, 01h
	JOGO_LOOOP:
		call CABECALHO
		call MOVIMENTACAO
		mov bx, offset tiroHeroi
		call MOVIMENTA_TIRO
		
		mov bx, offset tiroAlien
		call MOVIMENTA_TIRO
		call HEROI_ATINGIDO
		call ALVO_ATINGIDO
		call CHUMBO_TROCADO

		push cx
		mov bx, offset linha_1
		mov dx, 0000h
		
		mov cx, 06h
	LOOP_LINHA:	
		mov si, 0000h
		mov ax, ds:[bx + 04h]
		cmp ax, 0bah
		jl LOOP_CONTINUE
		push cx
	LOOP_ALIEN:
		mov ax, ds:[bx + si + 08h]
		cmp ax, 0000h
		je FIM_DE_JOGO			
		add si, 02h
		LOOP LOOP_ALIEN
		pop cx
	LOOP_CONTINUE:
		add bx, 1ch
		LOOP LOOP_LINHA	
		pop cx

		call EXISTEM_ALIEN_VIVOS
		
		mov bx, offset millenium_falcon
		mov cx, ds:[bx]	
		
		cmp cx, 00h
		jne JOGO_LOOOP
		
		
		pop ax bx cx dx
		ret
		
		
	FIM_DE_JOGO:	
		pop cx cx
		pop ax bx cx dx
		ret
	endp
	
	LINHA_ALIENS_INICIO proc
		push ax bx cx dx
		
		mov ax, 40h
		mov bx, 50h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_1
		call DESENHA_P
		
		mov ax, 40h
		mov bx, 70h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_2
		call DESENHA_P
		
		mov ax, 40h
		mov bx, 90h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_3
		call DESENHA_P
		
		mov ax, 40h
		mov bx, 0b0h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_4
		call DESENHA_P
		
		mov ax, 40h
		mov bx, 0d0h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_5
		call DESENHA_P
		
		mov ax, 40h
		mov bx, 0f0h
		mov cx, offset tamanhoNave
		mov dx, offset str_alien_6
		call DESENHA_P
		pop dx cx bx ax
		ret
	endp
	
	TELA_INICIAL proc
	
		push ax bx cx dx
		push ds
		push bp
		push es
		push di
		push si
		
	TELA_INICIAL_I:
		mov ah, 00h
		mov al, 13h
		int 10h
		;;;
		call LINHA_ALIENS_INICIO
		mov ax, 1301h
		mov bh, 0 
		mov bl, 0fh 
		mov cx, spaceFim - offset space			 ;
		mov dl, 18 
		mov dh, 5
		push ds
		pop es
		mov bp, offset space 
		int 10h
		
		mov cx, invadersFim - offset invaders
		mov dl, 20
		mov dh, 6
		mov bp, offset invaders
		int 10h
			
			
		mov cx, jogarFim - offset jogar
		mov dl, 10h
		mov dh, 0bh
		mov bp, offset jogar
		int 10h	
		
		mov cx, scoresFim - offset scores
		mov dl, 10h
		mov dh, 0dh
		mov bp, offset scores
		int 10h	
		
		mov cx, sairFim - offset sair
		mov dl, 10h
		mov dh, 0fh
		mov bp, offset sair
		int 10h	
			
			
		mov ax, 0100h
		int 21h
		cmp al, 'j'
		je TL_JOGO
		cmp al, 'r'
		je TL_SCORES
		cmp al, 's'
		je TL_SAIR
		jmp TELA_INICIAL_I

	TL_JOGO:
		mov ah, 00h
		mov al, 13h
		int 10h	
		call SET_FALCON
		call JOGO
		call TELA_PONTUACAO
		jmp TELA_INICIAL_I
	TL_SCORES:
	
	TL_SAIR:
		pop si
		pop di
		pop es
		pop bp
		pop ds 
		pop dx cx bx ax
		ret
	endp


	inicio:
		mov ax, @DATA
		mov ds, ax
		
		mov ah, 01h
		int 16h
		
		mov ah, 00h
		mov al, 13h
		int 10h
		push cx
		mov cx, 0000h
		dec cx
		pop cx
		
		mov ah, 2ch		;2CH obtem o tem atual do sistema
		int 21h			;Pela interrupção do 21h
		mov bx, offset ultimoMovimento
		mov ds:[bx], dx
		
		;call TELA_PONTUACAO
		call TELA_INICIAL

		
		mov al, 0
		mov ah, 4ch
		int 21h
end inicio