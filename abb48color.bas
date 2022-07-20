   set romsize 4k
   const logo_color=$0E
   const logo_height=75
   COLUBK=$00      
SubTitleLoop
   if joy0fire then goto SubMainLoop
   gosub drawlogo
   goto SubTitleLoop

SubMainLoop
   COLUPF=$0E
   drawscreen
   goto SubMainLoop

   inline abb.asm
