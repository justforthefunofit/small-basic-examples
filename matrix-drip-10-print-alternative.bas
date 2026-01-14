10 print chr$(147)
20 dim c(40)
30 dim u(40)
40 cm = 55296 : rem color screen memory
50 sm = 1024  : rem screen start memory
60 i=int(rnd(1)*40)  : rem random column x position
70 d=int(rnd(1)*10)  : rem random dept
90 for n=0 to d
100   if c(i)<=24thenc(i)=c(i)+1
110   poke sm+i+(c(i)-1)*40,77+int(rnd(1)*2): rem random char
120  if c(i)=24 and u(i)=0 then u(i)=1:s=s+1: if s=40 then end
130 next n
140 l=c(i) 
150 dc=0
160 if l>24 then dc=1
170 for m=0 to l-1
180    mp=i+m*40
190    poke cm+mp,dc
200    poke sm+mp,81
210    poke sm+mp,77+int(rnd(1)*2)
220 nextm
230 goto 60
