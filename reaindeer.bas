1000 rem ----------------------------------------
1010 rem define and read all sprites into memory
1020 rem ----------------------------------------
1025 v=53248:dim x(5):dim d(5):dim sa(5)
1030 poke 53276,16: rem set multicolor for sprite 5 santa claus
1040 poke 53285,1: rem multicolor 1 santa white
1050 poke 53286,7: rem multicolor 2 santa
1060 poke 53269,255 : rem set all 8 sprites visible
1070 for x=12800 to 12800+63: read y: poke x,y: next x: rem reindeer sprite
1080 for x=12864 to 12864+63: read y: poke x,y: next x: rem santa sprite (left)
1090 for x=12928 to 12928+63: read y: poke x,y: next x: rem santa sprite (left)
1100 for x=12992 to 12992+63: read y: poke x,y: next x: rem santa sprite (left)
1110 :: rem sprite0
1120 poke 53287,2:rem color of the reindeer
1130 poke 53288,2
1140 poke 53289,2
1150 poke 53290,2
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
1270 rem --- reindeer
1280 data 168,0,0,68,64,0,137,128,0,203,0,0,122,0,0,46
1290 data 0,0,40,0,0,252,0,0,126,0,0,31,0,8,31,192
1300 data 48,31,255,192,15,255,240,7,255,192,7,255,192,3,255,240
1310 data 1,192,120,0,192,28,0,96,6,0,96,2,0,0,0,8
1320 rem -- santaclaus
1330 data 0,0,0,0,0,0,0,0,0,0,40,0,0,150,0,0
1340 data 102,128,0,38,8,0,22,42,0,25,42,40,90,42,40,24
1350 data 34,170,42,160,138,20,160,2,42,160,34,170,160,34,170,128
1360 data 128,170,130,128,128,162,162,128,34,42,0,10,10,170,168,130
1370 rem -- reindeer to the right
1380 data 0,0,21,0,2,34,0,1,145,0,0,211,0,0,94,0
1390 data 0,116,0,0,20,0,0,63,0,0,126,16,0,248,12,3
1400 data 248,3,255,248,15,255,240,3,255,224,3,255,224,15,255,192
1410 data 30,3,128,56,3,0,96,6,0,64,6,0,0,0,0,8
1420 rem santa claude to the right
1430 data 0,0,0,0,0,0,0,0,0,0,40,0,0,150,0,2
1440 data 153,0,32,152,0,168,148,0,168,100,0,168,165,40,136,36
1450 data 40,10,168,170,10,20,162,10,168,128,10,170,136,2,170,136
1460 data 130,170,2,138,2,2,136,2,138,160,0,168,42,170,160,130
1470 rem ----------------------------------------
1472 rem initialise sprite positions
1475 rem ----------------------------------------
1480 x(1)=x:x(2)=x-20:x(3)=x-40:x(4)=x-60:x(5)=x+20
1490 fori=1to5:d(i)=-5:next
1492 rem ----------------------------------------
1495 rem move the sprites to the locations
1496 rem ----------------------------------------
1500 poke v  ,x(1):poke v+1,y
1510 poke v+2,x(2):poke v+3,y-3
1520 poke v+4,x(3):poke v+5,y-6
1530 poke v+6,x(4):poke v+7,y-9
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


