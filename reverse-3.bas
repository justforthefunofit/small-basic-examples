100 rem ---        just for the fun of it        ---
105 rem --------------------------------------------
110 rem --- reverse a byte (using a loop)
115 rem --------------------------------------------
120 b = int(rnd(1)*255)
125 for n=0to7
130   if b and 2^n then r = r+2^(7-n)
135 next
140 print "reversed :" b, r