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
 counter = 120

cutscene
 drawscreen
 
 if counter > 0 then counter = counter - 1 else goto mainsetup
 goto cutscene

mainsetup
 player0x = 45
 player0y = 15
 COLUPF = $00
 
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
 
mainloop
 COLUP0 = $46
 drawscreen
 player0y = player0y + 1
 if joy0right then if player0x < 130 then player0x = player0x + 1
 if joy0left then if player0x > 10 then player0x = player0x - 1
 goto mainloop
