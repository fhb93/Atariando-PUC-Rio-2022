game
.L00 ;  rem Generated 7/19/2022 12:42:29 PM by Visual bB Version 1.0.0.568

.L01 ;  rem **********************************

.L02 ;  rem *<Ringo 2600>                    *

.L03 ;  rem *<description>                   *

.L04 ;  rem *<Felipe and Tomaz>              *

.L05 ;  rem *<contact info>                  *

.L06 ;  rem *<free>	                      *

.L07 ;  rem **********************************

.
 ; 

.L08 ;  set kernel_options pfcolors

.L09 ;  set tv ntsc

.L010 ;  include 6lives_statusbar.asm

.L011 ;  statusbarlength  =  144

	LDA #144
	STA statusbarlength
.L012 ;  const scorefade  =  0

.L013 ;  scorecolor  =  $1C

	LDA #$1C
	STA scorecolor
.
 ; 

.L014 ;  dim sounda  =  a

.L015 ;  dim soundb  =  b

.L016 ;  dim counter  =  c

.L017 ;  dim d  =  d

.L018 ;  dim e  =  e

.L019 ;  dim f  =  f

.L020 ;  dim g  =  g

.L021 ;  dim h  =  h

.L022 ;  dim i  =  i

.L023 ;  dim j  =  j

.L024 ;  dim k  =  k

.L025 ;  dim l  =  l

.L026 ;  dim m  =  m

.L027 ;  dim n  =  n

.L028 ;  dim o  =  o

.L029 ;  dim p  =  p

.L030 ;  dim q  =  q

.L031 ;  dim rand16  =  r

.L032 ;  dim statusbarcolor  =  s

.L033 ;  dim t  =  t

.L034 ;  dim u  =  u

.L035 ;  dim v  =  v

.L036 ;  dim w  =  w

.L037 ;  dim x  =  x

.L038 ;  dim y  =  y

.L039 ;  dim z  =  z

.L040 ;  dim _sc1  =  score

.L041 ;  dim _sc2  =  score + 1

.L042 ;  dim _sc3  =  score + 2

.
 ; 

.L043 ;  rem start/restart ........................................................................

.
 ; 

.start_restart
 ; start_restart

.
 ; 

.L044 ;  AUDV0  =  0  :  AUDV1  =  0

	LDA #0
	STA AUDV0
	STA AUDV1
.L045 ;  a  =  0  :  b  =  0  :  c  =  0  :  d  =  0  :  e  =  0  :  f  =  0  :  g  =  0  :  h  =  0  :  i  =  0

	LDA #0
	STA a
	STA b
	STA c
	STA d
	STA e
	STA f
	STA g
	STA h
	STA i
.L046 ;  j  =  0  :  k  =  0  :  l  =  0  :  m  =  0  :  n  =  0  :  o  =  0  :  p  =  0  :  q  =  0  :  r  =  0

	LDA #0
	STA j
	STA k
	STA l
	STA m
	STA n
	STA o
	STA p
	STA q
	STA r
.L047 ;  s  =  0  :  t  =  0  :  u  =  0  :  v  =  0  :  w  =  0  :  x  =  0  :  z  =  0

	LDA #0
	STA s
	STA t
	STA u
	STA v
	STA w
	STA x
	STA z
.L048 ;  player0y  =  200  :  player1y  =  200  :  bally  =  200

	LDA #200
	STA player0y
	STA player1y
	STA bally
.
 ; 

.L049 ;  rem title ........................................................................

.
 ; 

.titlescreen
 ; titlescreen

.
 ; 

.L050 ;  scorecolor  =  $1E

	LDA #$1E
	STA scorecolor
.L051 ;  statusbarcolor  =  $00

	LDA #$00
	STA statusbarcolor
.L052 ;  COLUBK  =  $00

	LDA #$00
	STA COLUBK
.
 ; 

.L053 ;  playfield:

  ifconst pfres
	  ldx #(11>pfres)*(pfres*pfwidth-1)+(11<=pfres)*43
  else
	  ldx #((11*pfwidth-1)*((11*pfwidth-1)<47))+(47*((11*pfwidth-1)>=47))
  endif
	jmp pflabel0
PF_data0
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %10000000, %00000000
 endif
	.byte %00111010, %00011101
	if (pfwidth>2)
	.byte %10000111, %00111101
 endif
	.byte %00101010, %00000101
	if (pfwidth>2)
	.byte %10000000, %00100001
 endif
	.byte %00111010, %00000101
	if (pfwidth>2)
	.byte %10000001, %00110001
 endif
	.byte %00100011, %10011101
	if (pfwidth>2)
	.byte %11000011, %00011000
 endif
	.byte %00000000, %10000000
	if (pfwidth>2)
	.byte %11000110, %00001100
 endif
	.byte %00011001, %01001110
	if (pfwidth>2)
	.byte %10100100, %00000100
 endif
	.byte %00010101, %01001110
	if (pfwidth>2)
	.byte %10100111, %00111101
 endif
	.byte %00000000, %01100000
	if (pfwidth>2)
	.byte %10110000, %00000000
 endif
	.byte %00000000, %00110000
	if (pfwidth>2)
	.byte %10011000, %00000000
 endif
	.byte %00000000, %10011100
	if (pfwidth>2)
	.byte %11001110, %00000000
 endif
pflabel0
	lda PF_data0,x
	sta playfield,x
	dex
	bpl pflabel0
.
 ; 

.L054 ;  pfcolors:

 lda # $60
 sta COLUPF
 ifconst pfres
 lda #>(pfcolorlabel13-132+pfres*pfwidth)
 else
 lda #>(pfcolorlabel13-84)
 endif
 sta pfcolortable+1
 ifconst pfres
 lda #<(pfcolorlabel13-132+pfres*pfwidth)
 else
 lda #<(pfcolorlabel13-84)
 endif
 sta pfcolortable
.
 ; 

.L055 ;  drawscreen

 jsr drawscreen
.
 ; 

.L056 ;  if joy0fire then goto main

 bit INPT4
	BMI .skipL056
.condpart0
 jmp .main

.skipL056
.L057 ;  goto titlescreen

 jmp .titlescreen

.
 ; 

.L058 ;  rem main_mainsetup........................................................................

.
 ; 

.L059 ;  rem mainloop  .........................................................................

.
 ; 

.main
 ; main

.
 ; 

.L060 ;  playfield:

  ifconst pfres
	  ldx #(11>pfres)*(pfres*pfwidth-1)+(11<=pfres)*43
  else
	  ldx #((11*pfwidth-1)*((11*pfwidth-1)<47))+(47*((11*pfwidth-1)>=47))
  endif
	jmp pflabel1
PF_data1
	.byte %00000000, %11100000
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11111000
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11111100
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11110000
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %11000000
	if (pfwidth>2)
	.byte %11111111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00011111, %11111111
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %01010100
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11111000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11100000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
	.byte %00000000, %00000000
	if (pfwidth>2)
	.byte %00000000, %11000000
 endif
pflabel1
	lda PF_data1,x
	sta playfield,x
	dex
	bpl pflabel1
.
 ; 

.L061 ;  pfcolors:

 lda # $DC
 sta COLUPF
 ifconst pfres
 lda #>(pfcolorlabel13-131+pfres*pfwidth)
 else
 lda #>(pfcolorlabel13-83)
 endif
 sta pfcolortable+1
 ifconst pfres
 lda #<(pfcolorlabel13-131+pfres*pfwidth)
 else
 lda #<(pfcolorlabel13-83)
 endif
 sta pfcolortable
.L062 ;  a  =  120

	LDA #120
	STA a
.cutscene
 ; cutscene

.L063 ;  drawscreen

 jsr drawscreen
.L064 ;  a  =  a  -  1

	DEC a
.L065 ;  if a  =  =  0 then goto mainsetup

; complex condition detected
	LDA =
