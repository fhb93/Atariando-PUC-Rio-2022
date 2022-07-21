  rem CODE INSPIRED BY Atarius Maximus at http://www.atariage.com/forums/index.php?showtopic=109288
   set kernel_options player1colors playercolors pfcolors
  player0x = 50
  player0y = 50
main
  f=f+1
  rem POSSIBLY INEFFICIENT CODE, SEPARATE COLOR INFO FOR EACH FRAME...
  if f = 3 then player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %11111111
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
end
   if f = 3 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 6 then player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %00001111
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
end
   if f = 6 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 9 then player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %00000000
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
end
   if f = 9 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 12 then player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %00000000
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
end
   if f = 12 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 15 then player0:
        %00101100
        %01111110
        %11111111
        %11111111
        %11111111
        %00000000
        %11111111
        %11111111
        %01101110
        %00011000
        %00001100
end
   if f = 15 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 18 then player0:
        %00000100
        %00101010
        %01010101
        %10101010
        %01010101
        %00000000
        %10101010
        %01010101
        %00101010
        %00010000
        %00001000
end
   if f = 18 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 21 then player0:
        %00000100
        %00000000
        %01010101
        %00000000
        %01010101
        %00000000
        %10101010
        %00000000
        %00101010
        %00000000
        %00001000
end
   if f = 21 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 24 then player0:
        %00000000
        %00000000
        %01000100
        %00000000
        %00010001
        %00000000
        %10001000
        %00000000
        %00100010
        %00000000
        %00001000
end
   if f = 24 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 27 then player0:
        %00000000
        %00000000
        %00000000
        %00000000
        %00010001
        %00000000
        %10001000
        %00000000
        %00000000
        %00000000
        %00001000
end
   if f = 27 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end
  if f = 30 then player0:
        %00000000
        %00000000
        %00000000
        %00000000
        %00000001
        %00000000
        %10000000
        %00000000
        %00000000
        %00000000
        %00001000
end
   if f = 30 then player0color:
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
    $32;
end

  if f=30 then f=0

  if joy0right then REFP0 = 0
  if joy0left then REFP0 = 8

  drawscreen

  if joy0right then player0x = player0x + 1
  if joy0left then player0x = player0x - 1
  if joy0up then player0y = player0y - 1
  if joy0down then player0y = player0y + 1

  goto main
