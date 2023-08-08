1 rem --  just for the fun of it   --
2 rem -------------------------------
3 rem -    pattern bouncing ball
4 rem -------------------------------
5 rem
10 printchr$(147):poke214,24:?:poke211,8:?"pattern bouncing ball"
20 sm=1024:x=int(rnd(1)*24):y=1:dy=1:dx=1
30 poke 55296 +x+(y*40),5+dy:if y>=22 or y < 1 then dy=-dy 
40 if x>=39 or x<1 then dx=-dx 
50 x=x+dx:y=y+dy:poke sm+x+(y*40),81:fors=1to50:next:goto 30