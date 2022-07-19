 rem Generated 19/07/2022 10:00:00 by Visual bB Version 1.0.0.568
 rem ************************************************************
 rem *<Game Name>                                               *
 rem *<slogan>                                                  *
 rem *<Atariando - Guilherme Xavier and Augusto Baffa>	         *
 rem *<guix@puc-rio.br / abaffa@puc-rio.br>                     *
 rem *<free>                                                    *
 rem ************************************************************

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

 if joy0fire then goto main_setup
 
 goto titlescreen

 rem main_setup ........................................................................

main_setup

 player0x = 45
 player0y = 70

 player1x = 55
 player1y = 55

 ballx = 55
 bally = 30

 missile0x = 100
 missile0y = 55

 missile1x = 120
 missile1y = 55

 scorecolor = $1C
 statusbarcolor = $1C

 rem CTRLPF = $04
 NUSIZ0 = $00 
 NUSIZ1 = $00
 COLUBK = $00
 COLUP0 = $02
 COLUP1 = $08
 COLUPF = $1E

 rem mainloop ........................................................................

main

 COLUP0 = $02
 COLUP1 = $08

 ballheight = 2
 bally = bally + 2

 missile0x = missile0x + 1
 missile1x = missile1x - 1

 score = score + 1 
 statusbarcolor = $30
 statusbarlength = statusbarlength - 1

 player0:
        %00000000
        %11100111
        %01000101
        %01100101
        %01010101
        %01010101
        %11100111
        %00000000
end

 player1:
        %00000000
        %11100111
        %01000010
        %01100010
        %01010010
        %01010010
        %11100110
        %00000000
end

 drawscreen

 playfield:
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ...............X................
 ................................
 ...............X................
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


  rem sounds
  if sounda > 0 then sounda = sounda - 1 : AUDV1 = 4 : AUDC1 = 4 : AUDF0 = sounda else AUDV1 = 0 
  if soundb > 0 then soundb = soundb - 1 : AUDV1 = 4 : AUDC1 = 4 : AUDF1 = soundb else AUDV1 = 0

  goto main

gameover

 playfield:
 ................................
 ................................
 ................................
 .XXX.XX..X.X.XXX..XX.X.X.XXX.XX.
 .X...X.X.XXX.X.X.X.X.X.X.X.X.X..
 .X.X.XXX.X.X.XX..X.X.X.X.XX..X..
 .X.X.X.X.X.X.X...X.X.XX..X...X..
 ..XX.X.X.X.X.XXX.XX..X...XXX.X..
 ................................
 ................................
 ................................
end

 AUDV0 = 0 : AUDV1 = 0
 sounda = 0 : soundb = 0 
 player0x = 145 : player0y = 20 
 player1x = 200 : player1y = 200 
 missile1x = 200 : missile1y = 200
 ballx = 200 : bally = 200
 if joy0fire then counter = counter + 1 else counter = 0
 if counter > 50 then reboot

 if switchreset then reboot

 drawscreen

 goto gameover 