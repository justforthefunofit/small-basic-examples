100 rem --  just for the fun of it   --
105 rem -------------------------------
110 rem - example using left string
115 rem -------------------------------
120 rem
125 print chr$(147):k$="":b$="":s$="              "
130 for t=1 to 10
135 k$=k$+"*" : b$=b$+"**"
140 print s$+k$
145 print left$(s$,len(s$)-t)+b$
150 next t
155 print left$(s$,len(s$)-1)+"***"