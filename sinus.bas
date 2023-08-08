1 rem --  just for the fun of it   --
2 rem -------------------------------
3 rem - draw a sinus on screen
4 rem -------------------------------
5 rem
10 for n=0 to 3*3.1415step0.05
20 x=int(4.2*n):y=int(11*sin(n))
25 o=y*40+x+480:poke1024+o,81:poke55296+o,1
30 next n