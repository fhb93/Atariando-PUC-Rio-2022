    set kernel_options pfcolors 
startLoop

    COLUBK=$00      

      playfield:
................................
...........XXXXXXXXXX...........
............X...X...............
...........XXXXXX..XX...........
............X..XXXX.............
.............XX.X...X...........
...........XX.X.XXXXX...........
.XX.............................
.XX..XX.XXX.XXX...X..X.X.XXX.XX.
..X.X.X.XXX.XX...X.X.X.X.XX..X..
.XX..XX.X.X.XXX...X...X..XXX.X..
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
 