100 rem ---        just for the fun of it        ---
105 rem --------------------------------------------
110 rem --- reverse a byte straightforward with str
115 rem --------------------------------------------
120 b = int(rnd(1)*255): r=. : b$="00000000":r$="00000000"
125 if b and 1 then  r=128  : r$ = "1" + mid$(r$,2,8)
130 if b and 2 then  r=r+64 : r$ = mid$(r$,1,1)+"1"+mid$(r$,3,8)
135 if b and 4 then  r=r+32 : r$ = mid$(r$,1,2)+"1"+mid$(r$,4,8)
140 if b and 8 then  r=r+16 : r$ = mid$(r$,1,3)+"1"+mid$(r$,5,8)
145 if b and 16 then r=r+8  : r$ = mid$(r$,1,4)+"1"+mid$(r$,6,8)
150 if b and 32 then r=r+4  : r$ = mid$(r$,1,5)+"1"+mid$(r$,7,8)
155 if b and 64 then r=r+2  : r$ = mid$(r$,1,6)+"1"+mid$(r$,8,8)
160 if b and 128 thenr=r+1  : r$ = mid$(r$,1,7)+"1"
165 print "reversed :" r , r$