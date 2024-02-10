10 print chr$(147)
20 print "generated with spritemate"
30 print "1 of 1 sprites displayed."
40 poke 53285,1: rem multicolor 1
50 poke 53286,7: rem multicolor 2
60 poke 53269,255 : rem set all 8 sprites visible
70 for x=12800 to 12800+63: read y: poke x,y: next x: rem sprite generation
80 rem sprite0
90 poke 53287,2: rem color = 2
100 poke 2040,200: rem pointer
110 poke 53248, 44: rem x pos
120 poke 53249, 120: rem y pos
130 poke 53276, 1: rem multicolor
140 poke 53277, 0: rem width
150 poke 53271, 0: rem height
1000 :: rem sprite0 / multicolor / color: 2
1100 data 0,0,0,0,0,0,0,0,0,0,40,0,0,150,0,0
1110 data 102,128,0,38,8,0,22,42,0,25,42,40,90,42,40,24
1120 data 34,170,42,160,138,20,160,2,42,160,34,170,160,34,170,128
1130 data 128,170,130,128,128,162,162,128,34,42,0,10,10,170,168,130
