10 printchr$(147):
20 dim c(40):dim u(40):cm=55296:sm=1024
30 i=int(rnd(1)*40):
40 d=int(rnd(1)*10):
50 forn=0tod:ifc(i)<=24thenc(i)=c(i)+1
60 REM pokesm+i+(c(i)-1)*40,77+int(rnd(1)*2)
70 ifc(i)=24andu(i)=0thenu(i)=1:s=s+1:ifs=40thenend
80 nextn:pokesm+i+(c(i)-1)*40,42
90  l=c(i): if l>=24 then 30
100 dc=0:ifl>24thendc=1
110 form=0tol-2
120 mp=i+m*40
150 pokesm+mp,32
160 nextm:
170 goto 30