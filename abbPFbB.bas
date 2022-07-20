    set kernel_options pfcolors 
startLoop

    COLUBK=$00      

      playfield:
..X...X....X..XXX........XXXXXXX
XXXXXXXXX.XXXX.X.X..XXX....X...X
.XXX.XXX...XX.XXX..X.X.X.XXX...X
X.X.X.X.X.XX.XXXXX.X..X...X.X..X
..X...X....X.X.X.X.......X....X.
................................
.............X..................
....X..XX.XX.X.XX...............
...X.X.X..X..X.XX...............
..........XX.X..X..X.X.XX.XX....
.........XX..X.X.X..X..XX.X.....
end 

  pfcolors:
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
   $0E
end

 drawscreen
 goto startLoop  
 