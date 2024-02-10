1 rem --  just for the fun of it   --
2 rem -------------------------------
3 rem - a colorfull snake on screen
4 rem -------------------------------
5 rem
10 c$=chr$(145)+chr$(157)+chr$(29)+chr$(17):print chr$(147)
15 printchr$(113)+chr$(157);:fort=1to50:next:poke646,rnd(.)*256
20 print chr$(18)+" "+chr$(146)+chr$(157)+mid$(c$,rnd(1)*4+1,1);:goto15