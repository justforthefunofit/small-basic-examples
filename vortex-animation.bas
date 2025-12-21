!- {166} - checkerboard character
!- {19} - cursor home
!- {157} - cursor left
!- {17} - cursor down
!- {148} - insert mode
!- {145} - cursor up
!- {29} - cursor right

!- readable version (vice formatted)
!- -------------------------------------------------
10 c=0
15 poke 646, rnd(.)*255
20 print"{19}";
25 if c>0 then for i=1 to c:print"{29}{17}";:next
30 for i=1 to 40-(2*c):print "{166}";:next i
35 print "{157}";
40 for i=1 to 24-(2*c):print "{166}{157}{17}";:next i
45 if c=0 then print "{157}{20}{29}{20}{29}{166}{157}{148}";
50 if c>0 then print "{166}"; 
55 for i=1 to 39-(2*c):print"{157}{157}{166}";:next
60 for i=1 to 24-(2*c):print"{145}{157}{166}";:next
65 c=c+1:if c=12 then print "{17}  just for fun ": goto 10
70 goto 15
