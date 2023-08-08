100 rem ---        just for the fun of it        ---
105 rem --------------------------------------------
110 rem --- reverse a byte straightforward method
115 rem --------------------------------------------
120 print chr$(147) : rem clear screen
125 b = int(rnd(1)*255) : rem generate a random byte value
130 r=.
135 if b and   1 then r=128   : rem validate bit 1 then set bit 8
140 if b and   2 then r=r+64  : rem validate bit 2 then set bit 7
145 if b and   4 then r=r+32  : rem validate bit 3 then set bit 6
150 if b and   8 then r=r+16  : rem validate bit 4 then set bit 5
155 if b and  16 then r=r+8   : rem validate bit 5 then set bit 4
160 if b and  32 then r=r+4   : rem validate bit 6 then set bit 3
165 if b and  64 then r=r+2   : rem validate bit 7 then set bit 2
170 if b and 128 then r=r+1   : rem validate bit 8 then set bit 1
175 print "original value";:?b;:?" reversed :" r