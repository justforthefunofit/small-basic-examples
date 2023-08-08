1 rem --  just for the fun of it   --
2 rem -------------------------------
3 rem -- painting of boogie woogie
4 rem -------------------------------
5 rem
125?cH(147)+cH(18):pO53281,1:s$=cH(161)+cH(162)+cH(169)+cH(182)+cH(127):c$="026"
130 forx=1to38:a=0:poke646,val(mid$(c$,int(rnd(1)*3+1),1))
135 if int(0.5*x+y-10)*int(-0.5*x+y+10)>=0 and y<=10 then a=1
140 if int(-0.5*x+y-10)*int(0.5*x+y-30)>=0 and y>=10 then a=1
145 t$=mid$(s$,int(rnd(1)*5+1),1):ifa=0thent$=cH(166)
150 pO214,y:?:pO211,x:?t$;:next: y=y+1:if y>=21 then y=0
155 goto130