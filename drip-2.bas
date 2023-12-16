100 rem ---------------------------------
110 rem create a dripping random print 10
120 rem    www.justforthefunofit.nl
130 rem ---------------------------------
140 printchr$(147)  : rem clear screen
150 dim c(40)       : rem memory location column
160 dim u(40)       : rem variable to determine column end
170 i=int(rnd(1)*40): rem determine random screen column
180 d=int(rnd(1)*10): rem determine random dept
190 for n=0 to d    : rem draw characters untill dept is reached
200 :
210 if c(i)<=24 then gosub 430 : rem place character in column
220 if c(i)=24 and u(i)= 0 then gosub 520 :rem repaint column
230 :
240 next n
250 gosub 280 : rem re-draw the string of characters downwards
260 goto 170  : rem continue loop
270 :
280 rem -------------------------------------
290 rem re-draw the character column for effect
300 rem -------------------------------------
310 l=c(i)             : rem get last dept from column
320 dc=0               : rem set default colour to black
330 if l>24 then dc=1  : rem set colour to white if column is full
340 for n=0 to l-1     : rem repaint colomn
350 mp=i+n*40          : rem calculate position
360 rc=77+int(rnd(1)*2): rem determine random print 10 character
370 poke 55296+mp,1    : rem set character memory colour
380 poke 1024 +mp,81   : rem place ball character
385 poke 55296+mp,dc   : rem set character memory colour
390 poke 1024 +mp,rc   : rem replace ball again for effect
400 next n
410 return
420 :
430 rem -------------------------------------
440 rem draw character on screen
450 rem -------------------------------------
460 c(i)=c(i)+1        : rem increment column count
470 mp=+i+(c(i)-1)*40  : rem calulate position
480 rc=77+int(rnd(1)*2): rem determine random print 10 character
490 poke1024+mp,rc     : rem place random character
500 return
510 :
520 rem -------------------------------------
530 rem mark column as full end if done
540 rem -------------------------------------
550 u(i)=1           : rem mark column as full
560 s=s+1            : rem count columns that are full
570 if s=40 then end : rem if all done end program
580 return           : rem continue program