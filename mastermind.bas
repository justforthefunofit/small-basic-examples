100 rem --  just for the fun of it   --
105 rem -------------------------------
110 rem -      mastermind example
115 rem -------------------------------
120 rem
125 print chr$(147):diml,s(4),a(4),c(4)
126 ?"solve the secret number"
127 ?"enter your numbers separated by a comma"
130 fori=1to4:s(i)=int(rnd(1)*10):a(i)=0:nexti
135 ?:input"enter code:"; a(1),a(2),a(3),a(4):for i=1 to 4:c$(i)="":for p=1to4
140 if s(i)=a(p) and i=p then c$(i)=chr$(113):l=l+1:p=4:goto 150
145 if s(i)=a(p) and i<>p then c$(i)=chr$(119)
150 next p, i:if l=4 then 165
155 ?"answer:";:for i=1to4:print a(i);:next:?
160 ?"check :";:for i=1to4:print c$(i);:next:?:l=0:goto 135
165 ?"you cracked it"