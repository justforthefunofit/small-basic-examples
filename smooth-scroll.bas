10 rem -----------------------------------
11 rem smooth scoll in commodore basic
12 rem just. anything more and this 
13 rem will be to slow and start to stutter
14 rem -----------------------------------
15 ? chr$(147)           : rem clear screen
16 x$="{home}{right*39}" : rem x cursor petscii chars
17 y$="{down*24}"        : rem y cusror petscii chars
18 rr=53266              : rem raster register
19 xr=53270              : rem xscroll control register 2
20 sl=1024+(10*40)       : rem first char at scroll line
21 se=sl+39              : rem last position at scroll line
22 :
23 ? left$(x$,5)left$(y$,10)"smooth scroll in basic just";
24 :
25  for i=7 to 0 step -1
26    poke xr,i           : rem smooth scroll 1 pixel left
27    wait rr,128,0       : rem wait on raster
28  next                  
29  c=peek(sl)            : rem get first char on scroll line
30  ?left$(x$,2)left$(y$,10)chr$(20): rem use del char 
31  poke se,c             : rem place char at end
40 goto 25                : rem repeat the process
