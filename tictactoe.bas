1 rem --  just for the fun of it   --
2 rem -------------------------------
3 rem -     the tic-tac-toe game
4 rem -------------------------------
5 rem
100 print chr$(147)
105 dim m(9):for n=1to9:m(n)=32:nextn : rem array to store positions
110 x= 17 : y= 0 :sr = 9 : c=1:r=0: p=0: l= 32
115 rem ---------------------------------
120 rem ---- draw play field on screen
125 rem ---------------------------------
130 poke214, 4:?:poke211,5:?"player 1 move place your piece"
135 poke214, 7:?:poke211,16:?"UCCCCCI"
140 poke214, 8:?:poke211,16:?"B B B B"
145 poke214, 9:?:poke211,16:?"BCCCCCB"
150 poke214,10:?:poke211,16:?"B B B B"
155 poke214,11:?:poke211,16:?"BCCCCCB"
160 poke214,12:?:poke211,16:?"B B B B"
165 poke214,13:?:poke211,16:?"JCCCCCK"
170 rem ----------------------------------
175 rem ---- input section check key entry
180 rem ----------------------------------
185 k = peek(203):s = peek(653) and 1  :rem save key and shift status
190 rem ----------------------------------
195 rem ---- check input characters x or o
200 rem ----------------------------------
205 poke214, 4:?:poke211,5
210 if k = 23 then l = 24 : ?"player 2 move place your piece"
215 if k = 38 then l = 15 : ?"player 1 move place your piece"
220 if k = 60 then l = 32 : rem input of space
225 rem ----------------------------------
230 rem ---- save user key and place on screen
235 rem ----------------------------------
240 m((r*3)+c)=l             : rem save cell in m(emory)
245 poke 1024+x+(y+sr)*40, l : rem place value on screen
250 rem ----------------------------------
255 gosub 345 : rem check on 3 on a row
260 rem ----------------------------------
265 rem ---- check cursor movement
270 rem ----------------------------------
275 if k=2 and s = 0 and x < 21    then x=x+2 : c=c+1
280 if k=2 and s = 1 and x > 17    then x=x-2 : c=c-1
285 if k=7 and s = 1 and sr+y > 9  then y=y-2 : r=r-1
290 if k=7 and s = 0 and sr+y < 13 then y=y+2 : r=r+1
295 rem ----------------------------------
300 rem ---- save user entry and place on screen
305 rem ----------------------------------
310 l = peek( 1024+x+(y+sr)*40)
315 poke 1024+x+(y+sr)*40, 102
320 rem ---------------------------------
325 goto 185 : rem repeat main loop
330 rem --------------------------------------
335 rem now determine if there is a 3 in a row
340 rem --------------------------------------
345 if m(1)=m(2) and m(2)=m(3) and m(1)<>32 then 415: rem we have a winner
350 if m(1)=m(5) and m(5)=m(9) and m(1)<>32 then 415
355 if m(4)=m(5) and m(5)=m(6) and m(4)<>32 then 415
360 if m(1)=m(4) and m(4)=m(7) and m(1)<>32 then 415
365 if m(2)=m(5) and m(5)=m(8) and m(2)<>32 then 415
370 if m(3)=m(6) and m(6)=m(9) and m(3)<>32 then 415
375 if m(7)=m(5) and m(5)=m(3) and m(7)<>32 then 415
380 if m(7)=m(8) and m(8)=m(9) and m(7)<>32 then 415
385 rem --------------------------------------
390 rem ---- check if all positions are used
395 rem --------------------------------------
400 p=0:for n=1to9:if m(n)<>32 then p=p+1
405 nextn:if p=9 then poke214,18:?:poke211,15:?"no winner": end
410 return : rem return to main loop
415 rem ---------------------------------------
420 rem ----- end of game
425 rem ---------------------------------------
430 poke214,18:?:poke211,5
435 ? "tik tac toe, we have a winner"
440 poke 198, 0: rem clear keyboard