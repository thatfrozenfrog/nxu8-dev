' essential variables                                                                                                                                                                                       
    e$         = chr$(27)                                                                                                                                                                                   
    j$         = chr$(13)                                                                                                                                                                                   
                                                                                                                                                                                                            
    ' ANSI colours                                                                                                                                                                                          
    reset$     = e$ + "[m"                                                                                                                                                                                  
    bold$      = e$ + "[1m"                                                                                                                                                                                 
    red$       = e$ + "[91m"                                                                                                                                                                                
    green$     = e$ + "[92m"                                                                                                                                                                                
    yellow$    = e$ + "[93m"                                                                                                                                                                                
    blue$      = e$ + "[94m"                                                                                                                                                                                
    magenta$   = e$ + "[95m"                                                                                                                                                                                
    cyan$      = e$ + "[96m"                                                                                                                                                                                
    blink$     = e$ + "[5m"                                                                                                                                                                                 
    under$     = e$ + "[4m"                                                                                                                                                                                 
    italic$    = e$ + "[3m"                                                                                                                                                                                 
    rev$       = e$ + "[7m"                                                                                                                                                                                 
print "User ROM searcher"                                                                                                                                                                                   
input "Search from (DEC): ", astart                                                                                                                                                                         
input "Search to   (DEC): ", aend                                                                                                                                                                           
input "Search for (USER): ", astr$                                                                                                                                                                          
strlen = len(astr$)                                                                                                                                                                                         
current = astart                                                                                                                                                                                            
dim aa(strlen)                                                                                                                                                                                              
print e$ "[?25l"                                                                                                                                                                                            
                                                                                                                                                                                                            
100 'Loop start                                                                                                                                                                                             
d = peek(current) 'Peek data                                                                                                                                                                                
                                                                                                                                                                                                            
if chr$(d) = mid$(astr$,1,1) then goto 200                                                                                                                                                                  
105 'Increment                                                                                                                                                                                              
current = current + 1                                                                                                                                                                                       
print "Pointing at "; current "|" current / aend * 100; "%"                                                                                                                                                 
print e$ "[1F";                                                                                                                                                                                             
if current > aend then goto 300 'End                                                                                                                                                                        
goto 100                                                                                                                                                                                                    
                                                                                                                                                                                                            
                                                                                                                                                                                                            
200 'Matched first letter        for i = 1 to strlen
    if chr$(peek(current + i - 1)) <> mid$(astr$, i, 1) then goto 105
    aa(i) = current + i - 1
next i
goto 400 'Found string

300 'String not found
print e$ "[2K";
print bold$ red$ "Error: String not Found" reset$
system

400 'String found

print e$ "[2K"
gosub 500

print bold$ green$ "Found string at: "; aa(1) reset$
print "Userdata starts at: " under$ aa(1) reset$ ", ends at: " under$ dataend reset$
print "Dumping the data"
print "----------------"

for i = aa(1) to dataend
if peek(i) = 00 then print "|| "
if peek(i) = 98 and peek(i + 1) = 66 then print "]] "
if peek(i) <> 00 then print chr$(peek(i));
next i
print ""
print ""
input "Press Enter to dump", nul$


getline$ = ""
for i = 0 to dataend - aa(1)

if i mod 16 = 0 then print space$(10); : print "| " getline$ : getline$ = "" : print (i + aa(1)) " ";
H$ = hex$(peek(i + aa(1)))
C$ = chr$(peek(i + aa(1)))
if peek(i + aa(1)) < 32 or peek(i + aa(1)) > 126 and peek(i + aa(i)) <> 00 then C$ = "."
if peek(i + aa(1)) = 00 then C$ = green$ + bold$ + "-" + reset$
getline$ = getline$ + C$
if len(H$) = 1 then H$ = "0" + H$
print H$ " ";

next ilinefresh$ = th_sed$(getline$, "(\x1B\[(.|..)m)", "", "gi") ': print len(linefresh$) "=" linefresh$;
nspace = (18 - len(linefresh$)) * 3 + 14 ': print "=" red$ nspace reset$;
print space$(nspace) "| " getline$ : getline$ = ""

 'Hexedit, one time use
print "====================="
input "Enter address (DEC): ", addr
input "Enter value   (DEC): ", value
poke addr, value
system

REM ================================================================

500 'Locate the end of userdata
for i = aa(1) to 1e6
if chr$(peek(i)) = "P" then goto 600
550 'Next i
print "Current: " i " -- " chr$(peek(i)) " -- " sub$
print e$ "[1F";
next i


600 'Located PORT
print red$ "Current: " i " -- " "PORT?" reset$

i = i + 5
if peek(i + 1) = 00 and chr$(peek(i + 2)) = "U" then dataend = i + 1 : return
goto 550