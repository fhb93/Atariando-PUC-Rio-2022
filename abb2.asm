LogoFrame
    VERTICAL_SYNC
    
; 37 lines of VBLANK
	lda #44                     ; 2     (5)
	sta TIM64T                  ; 3     (8)
    sleep 5                     ; 5     (13)
	lda #1                      ; 2     (15)
	sta VDELP0                  ; 3     (18)
	sta VDELP1                  ; 3     (21)
	lda #$A6                    ; 2     (23)
    sta COLUPF                  ; 3     (26)
    sleep 10                    ; 10    (36)
	sta RESP0                   ; 3     (39)
	sta RESP1                   ; 3     (42)
	lda #$20                    ; 2     (44)
	sta HMP1                    ; 2     (47)
    lda #$10                    ; 2     (49)
    sta HMP0                    ; 3     (52)
	lda #$33                    ; 2     (54)
	sta NUSIZ0                  ; 3     (57)
	STA NUSIZ1                  ; 3     (60)
	sta WSYNC
	sta HMOVE
	lda #logo_color
	sta COLUP0
	sta COLUP1
	
	
LogoWaitVBlank
	lda INTIM
	bne LogoWaitVBlank	; loop until timer expires
	sta WSYNC

; disable VBLANK
	lda #0
        sta VBLANK

; waste 51 scanlines
;	ldx #51
    ldx #(96 - (logo_height/2))
LogoVisibleScreen
    sta WSYNC
	dex
	bne LogoVisibleScreen



    ; Blank Screen and Set Playfield

    ldy #logo_height-1
    lda logo_colors,y
    sta COLUP0
    sta COLUP1

   jmp LogoLoop

   if >. != >[.+(logo_kernel_size)]
      align 256
   endif

    
LogoLoop
    sta WSYNC                       ; 3     (0)
    sty temp1                       ; 3     (3)
    lda logo_0,y                   ; 4     (7)
    sta GRP0                        ; 3     (10) 0 -> [GRP0]
    lda logo_1,y                   ; 4     (14)
    sta GRP1                        ; 3     (17) 1 -> [GRP1] ; 0 -> GRP0
    lda logo_2,y                   ; 4     (21)
    sta GRP0                        ; 3     (24*) 2 -> [GRP0] ; 1 -> GRP1
    ldx logo_4,y                   ; 4     (28) 4 -> X
    lda logo_5,y                   ; 4     (32)
    sta temp2                       ; 3     (35)
    lda logo_3,y                   ; 4     (39) 3 -> A
    ldy temp2                       ; 3     (42) 5 -> Y
    sta GRP1                        ; 3     (45) 3 -> [GRP1] ; 2 -> GRP0
    stx GRP0                        ; 3     (48) 4 -> [GRP0] ; 3 -> GRP1
    sty GRP1                        ; 3     (51) 5 -> [GRP1] ; 4 -> GRP0
    sta GRP0                        ; 3     (54) 5 -> GRP1
    ldy temp1                       ; 3     (57)
    lda logo_colors-1,y               ; 4     (61)
    sta COLUP0                      ; 3     (64)
    sta COLUP1                      ; 3     (67)
    dey                             ; 2     (69)
    bpl LogoLoop                    ; 3     (72)
logo_kernel_size = * - LogoLoop
    
    ldy #0
    sty GRP0
    sty GRP1
    sty GRP0
    sty GRP1
;	ldx #40
    ldx #((96 - (logo_height/2))-1)
LogoGap
    sta WSYNC
	dex                         ; 2     (2)
	bne LogoGap                 ; 2     (4)

LogoOverscanStart
; Enable VBLANK
	lda #2
        sta VBLANK
; overscan
	ldx #35
	stx TIM64T
	lda INTIM
	clc
	adc #128
	sta TIM64T
	rts

.drawlogo
	lda INTIM
	bmi .drawlogo	; loop until timer expires
	jmp LogoFrame


   if >. != >[.+(logo_height)]
      align 256
   endif

; Paste image information here

logo_0
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000001
	BYTE %00000001
	BYTE %00000001
	BYTE %00000011
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00100010
	BYTE %00100010
	BYTE %00010010
	BYTE %00010010
	BYTE %00001010
	BYTE %00001010
	BYTE %00000111
	BYTE %00000111
	BYTE %00111111
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00100010
	BYTE %00100010
	BYTE %00010010
	BYTE %00010010
	BYTE %00001010
	BYTE %00001010
	BYTE %00000111
	BYTE %00000111
	BYTE %00111111
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_1
	BYTE %00000000
	BYTE %01000100
	BYTE %01001010
	BYTE %01001010
	BYTE %01001010
	BYTE %01001010
	BYTE %11100100
	BYTE %00000000
	BYTE %00000000
	BYTE %01000101
	BYTE %01000101
	BYTE %01100101
	BYTE %01010111
	BYTE %01010101
	BYTE %01010101
	BYTE %01100101
	BYTE %00000000
	BYTE %00000000
	BYTE %00000001
	BYTE %00101010
	BYTE %00101011
	BYTE %00111010
	BYTE %10101011
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00010000
	BYTE %00010100
	BYTE %00010110
	BYTE %00010101
	BYTE %00010100
	BYTE %00010010
	BYTE %00011111
	BYTE %00000010
	BYTE %00001111
	BYTE %00011000
	BYTE %01010100
	BYTE %01010011
	BYTE %10010001
	BYTE %10010000
	BYTE %00001111
	BYTE %00010001
	BYTE %11001001
	BYTE %00000100
	BYTE %00000010
	BYTE %00000001
	BYTE %00000001
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00100010
	BYTE %00100010
	BYTE %00010010
	BYTE %01010010
	BYTE %10001010
	BYTE %10001010
	BYTE %00000111
	BYTE %00000111
	BYTE %10111111
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000010
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_2
	BYTE %00000000
	BYTE %10001010
	BYTE %10001010
	BYTE %10001010
	BYTE %10101011
	BYTE %10101010
	BYTE %11111011
	BYTE %00000000
	BYTE %00000000
	BYTE %01011010
	BYTE %01010001
	BYTE %01010001
	BYTE %01010000
	BYTE %01010001
	BYTE %01010000
	BYTE %01010000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00001001
	BYTE %00001001
	BYTE %00001001
	BYTE %00011101
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %01000000
	BYTE %00100000
	BYTE %00010000
	BYTE %01010000
	BYTE %10010000
	BYTE %10010000
	BYTE %11110000
	BYTE %00000000
	BYTE %11100000
	BYTE %00010000
	BYTE %10010000
	BYTE %10010000
	BYTE %01010000
	BYTE %00010000
	BYTE %11100000
	BYTE %00010000
	BYTE %00100000
	BYTE %01000000
	BYTE %10000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00100000
	BYTE %00100000
	BYTE %01000000
	BYTE %01000000
	BYTE %10000000
	BYTE %10000000
	BYTE %00000000
	BYTE %00000000
	BYTE %11100000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_3
	BYTE %00000000
	BYTE %10111101
	BYTE %10100000
	BYTE %10010000
	BYTE %10001000
	BYTE %10000100
	BYTE %10111100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %10000000
	BYTE %00101010
	BYTE %10111010
	BYTE %00101010
	BYTE %10110011
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00001101
	BYTE %00001001
	BYTE %00000101
	BYTE %00001101
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00110011
	BYTE %01001010
	BYTE %00001010
	BYTE %00001010
	BYTE %00110010
	BYTE %01000010
	BYTE %01000010
	BYTE %01001010
	BYTE %00110010
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %01000101
	BYTE %01000101
	BYTE %01000101
	BYTE %01111101
	BYTE %00101001
	BYTE %00101001
	BYTE %00101001
	BYTE %00010001
	BYTE %00010001
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_4
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00100000
	BYTE %00100000
	BYTE %10100000
	BYTE %11100000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %11011011
	BYTE %01010010
	BYTE %01001001
	BYTE %11011011
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %01010010
	BYTE %01010010
	BYTE %01010010
	BYTE %01010010
	BYTE %01110101
	BYTE %01010101
	BYTE %01010101
	BYTE %01110101
	BYTE %00100101
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00010001
	BYTE %00010001
	BYTE %00010001
	BYTE %00010001
	BYTE %00010001
	BYTE %10011001
	BYTE %01010101
	BYTE %01010101
	BYTE %10011001
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_5
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %01101010
	BYTE %01001010
	BYTE %01001010
	BYTE %01001100
	BYTE %01001000
	BYTE %01101110
	BYTE %01001010
	BYTE %01001010
	BYTE %01101100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %10111000
	BYTE %00100000
	BYTE %00100000
	BYTE %00100000
	BYTE %00110000
	BYTE %00100000
	BYTE %00100000
	BYTE %00100000
	BYTE %00111000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000


   if >. != >[.+(logo_height)]
      align 256
   endif

logo_colors
   .byte $2E
   .byte $2C
   .byte $2C
   .byte $2C
   .byte $2A
   .byte $2A
   .byte $2A
   .byte $28
   .byte $28
   .byte $28
   .byte $26
   .byte $26
   .byte $26
   .byte $24
   .byte $24
   .byte $24
   .byte $24
   .byte $22
   .byte $22
   .byte $22
   .byte $20
   .byte $20
   .byte $20
   .byte $1E
   .byte $1E
   .byte $1E
   .byte $1C
   .byte $1C
   .byte $1C
   .byte $1C
   .byte $1A
   .byte $1A
   .byte $1A
   .byte $18
   .byte $18
   .byte $18
   .byte $16
   .byte $16
   .byte $16
   .byte $14
   .byte $14
   .byte $14
   .byte $14
   .byte $12
   .byte $12
   .byte $12
   .byte $10
   .byte $10
   .byte $10
   .byte $0E
   .byte $0E
   .byte $0E
   .byte $0C
   .byte $0C
   .byte $0C
   .byte $0C
   .byte $0A
   .byte $0A
   .byte $0A
   .byte $08
   .byte $08
   .byte $08
   .byte $06
   .byte $06
   .byte $06
   .byte $04
   .byte $04
   .byte $04
   .byte $04
   .byte $06
   .byte $06
   .byte $04
   .byte $04
   .byte $04
   .byte $04

    
