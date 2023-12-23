100 printchr$(147):rem clear screen
110 dim sx(40):dim sy(40)   : rem reserve 40 memory xy snowflake locations
120 dim bx(131):dim by(131) : rem reserver the border coordinates
130 dim ss(40)              : rem snow stack counter for each row
140 for i=1to38:ss(i)=0:next: rem intitialize maximums
150 rem define cursor move string used to position al print actions
155 x$=chr$(19):fori=1to39:x$=x$+chr$(29):nexti : rem cursor x positions
156 fori=1to24:y$=y$+chr$(17):nexti             : rem cursor y positions
170 poke 53280,0: poke 53281,0                  : rem color screen to black
172 print left$(x$,8)right$(y$,10)"ho ho ho.. data loading..."
175 b$=chr$(81)+chr$(87)+chr$(90)+chr$(42): rem border characters
176 poke 53269,0: rem hide all 8 sprites 
180 gosub 1000  : rem create sprite
190 dim m$(7)   : rem merry christmas message
200 gosub 720   : rem define messages
210 gosub 670   : rem counter before new message is shown
220 bc=1        : rem initialise border character to change
241 gosub 3000  : rem put tree on screen build from petscii chars
250 gosub 480   : rem draw the border
255 poke 53269,255 : rem set all 8 sprites visible
270 rem randmomize a snowpattern of 40 snowflakes
280 for i=1to40:sx(i)=int(rnd(1)*29)+3:sy(i)=int(rnd(1)*20)+1:next i
300 rem put them on the screen using print
310 fori=1to40:print left$(x$,sx(i))right$(y$,sy(i))"*":next i
330 rem start selecting a random snowflake and move it down
340 l= int(rnd(1)*40)+1
350 if sy(l)<=19-ss(l)then print left$(x$,sx(l))right$(y$,sy(l))" "
360 sy(l)=sy(l)+1:if sy(l)>20-ss(l)then gosub 420
370 print left$(x$,sx(l))right$(y$,sy(l))"*"
390 gosub 570 : rem color a character in the border
395 gosub 1560: rem move santa 
400 goto 340  : rem redo select random snowflake to move
410 rem -------------------------
420 rem recalculate new snow position
421 rem -------------------------
422 poke646,int(rnd(1)*4)+2:ss(l)=ss(l)+1:ifss(l)>18 then ss(l)=18
450 sy(l)=1:sx(l)=int(rnd(1)*29)+3: rem calculate new random position
460 return
470 rem -------------------------
480 rem draw border
481 rem -------------------------
490 for i=1to40:bx(i)=i:by(i)=1:bx(66+i)=41-i:by(66+i)=22:nexti
500 for i=1to24:bx(39+i)=40:by(39+i)=i:bx(107+i)=1:by(107+i)=25-i:nexti
510 fOi=1to131:pO1024+bx(i)-1+(by(i)-1)*40,asc(mid$(b$,int(rnd(1)*4)+1,1)):nE
550 return
560 rem -------------------------
570 rem change border color
571 rem -------------------------
580 if bc>131thenbc=1
590 poke55296 +bx(bc)-1+(by(bc)-1)*40,1
600 poke55296 +bx(bc)-1+(by(bc)-1)*40,int(rnd(1)*4)+2
610 rem
620 poke1024+bx(bc)-1+(by(bc)-1)*40,asc(mid$(b$,int(rnd(1)*4)+1,1))
630 bc=bc+1
640 mc=mc+1:if mc>25then gosub 670:rem show new message
650 return
660 rem -------------------------
670 rem show christmas message
680 print left$(x$,10)right$(y$,23)m$(int(rnd(1)*7)+1):mc=1
700 return
720 rem define message
730 m$(1)= "    merry christmas     "
740 m$(2)= "   vrolijk kerstfeest   "
750 m$(3)= "   frohe weihnachten    "
760 m$(4)= "     feliz navidad      "
770 m$(5)= "  shengdan jie kuaile   "
780 m$(6)= "www.justforthefunofit.nl"
790 m$(7)= "   (c) 2023 by sjef     "
795 return
1000 rem ----------------------------------------
1010 rem define and read all sprites into memory
1020 rem ----------------------------------------
1025 v=53248:dim x(5):dim d(5):dim sa(5)
1030 poke 53276,16: rem set multicolor for sprite 5 santa claus
1040 poke 53285,1: rem multicolor 1 santa white
1050 poke 53286,7: rem multicolor 2 santa
1070 for x=12800 to 12800+63: read y: poke x,y: next x: rem reindeer sprite
1080 for x=12864 to 12864+63: read y: poke x,y: next x: rem santa sprite (left)
1090 for x=12928 to 12928+63: read y: poke x,y: next x: rem santa sprite (left)
1100 for x=12992 to 12992+63: read y: poke x,y: next x: rem santa sprite (left)
1110 :: rem sprite0
1120 poke 53287,2:rem color of the reindeer
1130 poke 53288,2:poke 53289,2:poke 53290,2
1160 poke 53291,8: rem color of santa multi color
1170 poke 2040,200: sa(1)=200:rem reindeer 1
1180 poke 2041,200: sa(2)=200:rem reindeer 2
1190 poke 2042,200: sa(3)=200:rem reindeer 3
1200 poke 2043,200: sa(4)=200:rem reindeer 4
1210 poke 2044,201: sa(5)=201:rem santa claus
1220 poke 53277, 0: rem width
1230 poke 53271, 0: rem height
1240 x=140:y=120
1250 gosub 1470
1260 return
1470 rem ----------------------------------------
1472 rem initialise sprite positions
1475 rem ----------------------------------------
1480 x(1)=x:x(2)=x-20:x(3)=x-40:x(4)=x-60:x(5)=x+20
1490 fori=1to5:d(i)=-5:next
1492 rem ----------------------------------------
1495 rem move the sprites to the locations
1496 rem ----------------------------------------
1500 poke v  ,x(1):poke v+1,y  :poke v+2,x(2):poke v+3,y-3
1520 poke v+4,x(3):poke v+5,y-6:poke v+6,x(4):poke v+7,y-9
1540 poke v+8,x(5):poke v+9,y
1550 return
1560 rem ----------------------------------------
1562 rem move all sprites one step
1565 rem ----------------------------------------
1570 fori=1to5:
1580  x(i)=x(i)+d(i):if x(i)<=0 then d(i)=5
1590 if x(i)=175 then d(i)=-5
1600 if sa(i)=200 and d(i)>0 then sa(i)=202:poke 2039+i,sa(i)
1610 if sa(i)=202 and d(i)<=0 then sa(i)=200:poke 2039+i,sa(i)
1620 if sa(i)=201 and d(i)>0 then sa(i)=203:poke 2039+i,sa(i)
1630 if sa(i)=203 and d(i)<=0 then sa(i)=201:poke 2039+i,sa(i)
1640 next 
1650 gosub 1500:return
2000 rem --- reindeer
2010 data 168,0,0,68,64,0,137,128,0,203,0,0,122,0,0,46
2020 data 0,0,40,0,0,252,0,0,126,0,0,31,0,8,31,192
2030 data 48,31,255,192,15,255,240,7,255,192,7,255,192,3,255,240
2040 data 1,192,120,0,192,28,0,96,6,0,96,2,0,0,0,8
2050 rem -- santaclaus
2060 data 0,0,0,0,0,0,0,0,0,0,40,0,0,150,0,0
2070 data 102,128,0,38,8,0,22,42,0,25,42,40,90,42,40,24
2080 data 34,170,42,160,138,20,160,2,42,160,34,170,160,34,170,128
2090 data 128,170,130,128,128,162,162,128,34,42,0,10,10,170,168,130
2100 rem -- reindeer to the right
2110 data 0,0,21,0,2,34,0,1,145,0,0,211,0,0,94,0
2120 data 0,116,0,0,20,0,0,63,0,0,126,16,0,248,12,3
2130 data 248,3,255,248,15,255,240,3,255,224,3,255,224,15,255,192
2140 data 30,3,128,56,3,0,96,6,0,64,6,0,0,0,0,8
2150 rem santa claude to the right
2160 data 0,0,0,0,0,0,0,0,0,0,40,0,0,150,0,2
2170 data 153,0,32,152,0,168,148,0,168,100,0,168,165,40,136,36
2180 data 40,10,168,170,10,20,162,10,168,128,10,170,136,2,170,136
2190 data 130,170,2,138,2,2,136,2,138,160,0,168,42,170,160,130
3000 rem tree
3020 ?chr$(147):?"                                        ";
3030 ?"                                       {reverse on}{gray}{169}";
3040 ?"{reverse off}                                      {reverse on}{cyan} {160}";
3050 ?"{reverse off}                                     {reverse on}{gray}{169}{169}{cyan} ";
3060 ?"{reverse off}                                    {reverse on}  {160}{gray}W";
3070 ?"{reverse off}                                   {reverse on}{169}{cyan}    ";
3080 ?"{reverse off}                                   {reverse on} {gray}{169}{cyan}{160}{gray}W{cyan} ";
3090 ?"{reverse off}                                   {reverse on}{gray}{169}{cyan} {160}  ";
3100 ?"{reverse off}                                   {reverse on}     ";
3110 ?"{reverse off}                                  {reverse on}{gray}W{cyan}     ";
3120 ?"{reverse off}                                  {reverse on}{gray}{169}{169}{cyan} {gray}W{cyan}  ";
3130 ?"{reverse off}                                  {reverse on}      ";
3140 ?"{reverse off}                                  {reverse on}      ";
3150 ?"{reverse off}                                  {reverse on} {gray}W{cyan}    ";
3160 ?"{reverse off}                                 {reverse on}{gray}{169}{169}{cyan}    {gray}W";
3170 ?"{reverse off}                                 {reverse on}{cyan}       ";
3180 ?"{reverse off}                                {reverse on}{gray}{169}{169}{cyan}    {gray}W{cyan} ";
3190 ?"{reverse off}                                {reverse on}  {gray}W{cyan}     ";
3200 ?"{reverse off}                                {reverse on}        ";
3210 ?"{reverse off}                               {reverse on}{gray}{169}{169}{cyan}   {gray}W{cyan}   ";
3220 ?"{reverse off}                               {reverse on}         ";
3230 ?"{reverse off}                              {reverse on}{gray}W{169}{cyan}        ";
3240 ?"{reverse off}                                     {reverse on}{gray}   ";
3250 ?"{reverse off}                                     {reverse on}   ";
3260 ?"{reverse off}                                     {reverse on}   "
4000 return

