100 print chr$(147)
110 bl=15:hl=20
120 rem line function defintions - bevel lines
130 def fn q(x) =  x + 10
140 def fn l(x) =  x + 15
150 def fn m(x) = -x + 25
160 def fn p(x) = -x + 30
170 rem straight lines horizontal and vertical
180 def fn n(y) = 6
190 def fn o(y) = 15
200 def fn a(x) = 15
210 def fn b(x) = 25
220 rem plot bevel lines
230 for v= 0 to bl
240  x=fn l(v)   :y=v    :gosub 380
250  x=fn m(bl-v):y=bl-v :gosub 380
260  x=fn p(v)   :y=v+6  :gosub 380
270  x=fn q(v)   :y=v+6  :gosub 380
280 next v
290 rem plot horizontal and vertical lines
300 for v = 0 to hl
310  x= 10+v   :y= fn n(v)   :gosub 380
320  x= 10+hl-v:y= fn o(hl-v):gosub 380
330  x= fn a(v):y= 1+v       :gosub 380
340  x= fn b(v):y= 1+hl-v    :gosub 380
350 next v
360 goto 220 : rem do it allover
370 rem plot the character on x,y location and random colour
380 POKE 646,int(rnd(1)*16)+1
390 pO214,y:?:pO211,x:?"*"
400 return