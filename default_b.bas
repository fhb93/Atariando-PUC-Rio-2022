 rem Generated 7/19/2022 12:42:29 PM by Visual bB Version 1.0.0.568
 rem **********************************
 rem *<Ringo 2600>                    *
 rem *<description>                   *
 rem *<Felipe and Tomaz>              *
 rem *<contact info>                  *
 rem *<free>	                      *
 rem **********************************

 set kernel_options pfcolors
 set tv ntsc
 include 6lives_statusbar.asm
 statusbarlength = 144
 const scorefade = 0
 scorecolor = $1C

 dim sounda = a
 dim soundb = b
 dim counter = c
 dim d = d 
 dim e = e 
 dim f = f 
 dim g = g
 dim h = h
 dim i = i
 dim j = j
 dim k = k 
 dim l = l
 dim m = m
 dim n = n 
 dim o = o 
 dim p = p
 dim q = q 
 dim rand16 = r
 dim statusbarcolor = s 
 dim t = t 
 dim u = u 
 dim v = v
 dim w = w 
 dim x = x
 dim y = y
 dim z = z 
 dim _sc1 = score
 dim _sc2 = score+1
 dim _sc3 = score+2
 
 rem start/restart ........................................................................

start_restart

 AUDV0 = 0 : AUDV1 = 0
 a = 0 : b = 0 : c = 0 : d = 0 : e = 0 : f = 0 : g = 0 : h = 0 : i = 0
 j = 0 : k = 0 : l = 0 : m = 0 : n = 0 : o = 0 : p = 0 : q = 0 : r = 0
 s = 0 : t = 0 : u = 0 : v = 0 : w = 0 : x = 0 : z = 0
 player0y = 200 : player1y = 200 : bally = 200

 rem title ........................................................................

titlescreen

 scorecolor = $1E
 statusbarcolor = $00
 COLUBK = $00

 playfield:
 ................X...............
 ..XXX.X.X.XXX...X....XXXX.XXXX..
 ..X.X.X.X.X.....X.......X....X..
 ..XXX.X.X.X.....X......XX...XX..
 ..X...XXX.XXX..XXX....XX...XX...
 ...............XXX...XX...XX....
 ...XX..X.XXX..X.X.X..X....X.....
 ...X.X.X.XXX..X.X.X..XXXX.XXXX..
 .............XX.X.XX............
 ............XX..X..XX...........
 ..........XXX..XXX..XXX.........
end 

 pfcolors:
   $60
   $60
   $62
   $64
   $64
   $66
   $68
   $68
   $6A
   $6C
   $6E
end

 drawscreen

 if joy0fire then goto main 
 goto titlescreen

 rem main_mainsetup........................................................................

 rem mainloop  .........................................................................

main 
 
 playfield:
 .............XXXXXXXXXXXXXXXXXXX
 ...........XXXXXXXXXXXXXXXXXXXXX
 ..........XXXXXXXXXXXXXXXXXXXXXX
 ............XXXXXXXXXXXXXXXXXXXX
 ..............XXXXXXXXXXXXXXXXXX
 ...................XXXXXXXXXXXXX
 ..........................X.X.X.
 ...........................XXXXX
 .............................XXX
 ..............................XX
 ..............................XX
end

 pfcolors:
  $DC
  $DC
  $DC
  $DC
  $DC
  $DC
  $26
  $26
  $26
  $26
  $26
end
 counter = 180
 
cutscene
 drawscreen
 if counter > 0 then counter = counter - 1 else goto mainsetup
 goto cutscene

mainsetup
 sounda = 0
 missile1height = 2
 missile1x = 75
 missile1y = 50
 ballx = 60
 bally = 90
 COLUP1 = $0E
 counter = 0
 b = 0
 b = 0
 d = 1
 player0x = 90
 player0y = 15
 COLUPF = $00
 statusbarcolor = $CE
 statusbarlength = 120

 playfield:
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
end

 player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
        %00000000
end

 ; d offset de movimentacao da queda
 ; b contagem de segundos, a cada 30 segundos, somar 1 ao offset d
 ; counter acumulador de 1 segundo

mainloop
 counter = counter + 1
 COLUP0 = $46
 COLUP1 = $0E
 NUSIZ1 = $30
 ; desembainhando a espada (WIP)
 if sounda < 3 then AUDV0 = sounda : AUDC0 = 8 : AUDF0 = 4 : sounda = sounda + 1
  ; if missile1x < h then missile1x = missile1x + d + d else missile1x = (rand&63) : missile1y = (rand&127) + 12
 
 ; if e > 10 && e < 100 && f > 15 && f < 140 then missile1x = e : missile1y = f else e = rand16 : f = rand16

 ; contagem dos segundos a cada 60 frames, os b segundos sao incrementados

 if counter > 60 then b = b + 1 : counter = 0
 ; a cada 30 segundos, aumentar a velocidade da queda da maca
 if b > 30 then b = 0 : d = d + 1

 ; movimentar a mira da espada
 if joy0right then if missile1x < 106 then missile1x = missile1x + 4
 if joy0left then if missile1x > 14 then missile1x = missile1x - 4
 if joy0up then if missile1y > 8 then missile1y = missile1y - 4 
 if joy0down then if missile1y < 146 then missile1y = missile1y + 4

 ; fazer o corte
 if joy0fire then COLUP1 = $FE : if missile1x < 130 then missile1x = missile1x + 16
 
 ; checagem se houve colisao e o jogador estava pressionando o botao de disparo
 if collision(player0, missile1) && joy0fire then score = score + 1 : player0y = 0 : player0x = (rand&127)+20
 ; maca caindo, se ela cair no chao, jogador perde uma das suas 7 vidas
 if player0y < 150 then player0y = player0y + d else statusbarlength = statusbarlength - 20 : player0y = 0 : player0x = (rand&127)+20
 drawscreen
 ; if collision(player0, missile1) then if statusbarlength > 0 then statusbarlength = statusbarlength - 1 : goto mainloop

 ; se o jogador perdeu as 7 vidas, fazer o game over mais epico depois
 if statusbarlength = 0 then reboot

 goto mainloop