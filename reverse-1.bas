100 rem ---        just for the fun of it        ---
105 rem --------------------------------------------
110 rem --- reverse a byte and show bits in a string
115 rem --------------------------------------------
120 rem
122 print chr$(147)            : rem clear screen
125 b=int(rnd(1)*255)          : rem generate random example byte value
130 r$="" :o$="00000000" :sb=. : rem initialise variables
135 for n=0to7
140    if b and 2^n then r = r+2^(7-n):sb=1 : rem check if bit is true
145 r$=r$+mid$("01",1+sb,1)                 : rem fill reverse string position
150 o$=left$(o$,7-n)+mid$("01",1+sb,1)+right$(o$,1+n) : rem set original string
155 sb=. : rem set bit validator to false (0)
160 next : rem chech next bit of byte
165 rem -------------------------------------------
170 rem --- print original value and reversed value
175 rem -------------------------------------------
180 ?"original byte value:" b,left$(o$,8):?"reversed byte value:"r,r$