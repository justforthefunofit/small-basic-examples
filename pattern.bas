10 rem -- www.justforthefunofit.nl --
20 rem creating a maze using a
30 rem circle method to fill the screen
40 rem --------------------------------
50 print chr$(147)
60 for r=1 to 24
70 for a=0 to 360 
80 y=(int(r*cos(a))+12)
90 x=int(r*sin(a))+20
100 rem correcting screen bouderies
110 if y < 0 then y=0
120 if y > 24then y=24
130 if x < 0 then x=0
140 if x > 40then x=40
150 poke 1024+y*40+x,77+int(rnd(1)*2)
160 next a,r
