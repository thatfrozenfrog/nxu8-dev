' essential variables
    e$         = chr$(27)
    j$         = chr$(13)    'jumps to first line
    file$      = argv$(0)
    ver$       = "0.9"
    curhost$   =  th_re$( th_hostname$, "[^\s]+")
    regpath$   = "[^\!]+"
    avoid$     = ""

    ' Mods
    'pcrackinstallmod = 1


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

   'Functions
        def fncols$(a$,b$) = th_sprintf$(green$ + bold$ + "%S " + reset$ + red$ + "%S" + reset$, a$, b$)
'   Arguments parsing
    target$ = ""
    gentime = 0
    ftpfile = 0
    for i = 1 to argc%-1
        if i = 1 then target$ = argv$(1)
        if i = 2 then gentime = val(argv$(2))
        if i = 3 then ftpfile = val(argv$(3))
    next i
    if target$ = "" then input "Host name: ", target$
    if gentime = 0  then input "Generate time: ", gentime
    gentime = val(gentime)
    ftpfile = val(ftpfile)
    sleep 1
    
10 ' Suika wonky intro screen
    print e$ "[2J" e$ "[H"
    stripe = 0
    open ".suikaintro", as #1
15  if eof(1) then goto 20
    input# 1, line$
    stripe = stripe + 0.5
    if stripe mod 2 = 0 then print red$ bold$ blink$ line$ reset$
    if stripe mod 2 = 1 then print green$ bold$ blink$ line$ reset$
    goto 15
20  close #1
    print bold$ + red$ + string$(48,"=") + reset$
   
    print fncols$("Version:",ver$)
    print fncols$("Package:","Auto - automatically login into desired host")

30  ? fncols$("Hostname:",target$)
    ? fncols$("Generate time:",gentime)
    if ftpfile then ? fncols$("Ftp file:","ON")
    ? bold$ under$ "Generating " str$(gentime) " times..." reset$
    

    ' Module 1: Loops n time and join it
        th_exec "uupath " + target$, rawpath$
        if pos(rawpath$,"%host not found") <> 0 then ? red$ bold$ underline$ "Invalid host" reset$ : beep : end 'Check if host is valid or not
        for i = 1 to gentime
            th_exec "uupath " + target$, pathout$
            ? "Generate " i " time"
            rawpath$ = rawpath$ + pathout$
        next i
        ? "Finished module 1."

35  ' Module 2: Loops through every paths
        maxscore = -1 : maxpos = 0
        for n = 1 to th_re(rawpath$,".+",1)
            curpath$ = th_re$(rawpath$,".+",n)
            if pos(curpath$,"%avoid") then goto 40
            'print curpath$
            ' Ranking the current path
                score = 0
                for i = 1 to th_re(curpath$,regpath$,i)
                    curhost$ = th_re$(curpath$,regpath$,i)
                    if th_haslogin(curhost$) = 1 then score = score + 1
                next i
                if score > maxscore then maxscore = score : maxpos = n
                '? "Ranked path:" n ". Score:" score  
40      next n
        way$ = th_re$(rawpath$,".+",maxpos)
        ? rev$ blue$ bold$ "Finished module 2. Max score: " maxscore reset$
        ? rev$ blue$ bold$ "Path locked: " way$ reset$

     ' Module 3: Crawl the way to host
        print th_re(way$,regpath$,1)
        print th_re$(way$,regpath$,th_re(way$,regpath$,1))

        for i = 2 to th_re(way$,regpath$,1)
            hostahead$ = th_re$(way$,regpath$,i)
            hostahead$ = th_re$(hostahead$,"\b[a-zA-Z0-9-]+\b") 'Weird fix for invisible added characters
            print red$ "Host ahead: " reset$ rev$ hostahead$ reset$
            if th_haslogin(hostahead$) = 0 then goto 50
41          if th_haslogin(hostahead$) = 1 then th_exec ("rlogin " + hostahead$),out$ : gosub 80
            
42      next i

        goto 100
		
50          'Submodule 3.1: Hack a host, and transfer kits to it
                ' Initial cracking
     '           beep 'Yo!
    '            hackprog$ = ""
'               if pos(dir$,"porthack.exe") then hackprog$ = "porthack.exe"
   '             if pos(dir$,"pcrack.exe") then hackprog$ = "pcrack.exe"
  '              if hackprog$ = "" then goto 1000 'In here I implemented a clever trick to bypass pcrack auto install mod
'51				th_exec (hackprog$ + " " + hostahead$)
           
				
				beep 'V2
				if pos(dir$, "porthack.exe") and pos(dir$, "pcrack.exe") then goto 51
				if pos(dir$, "pcrack.exe") then goto 52
				if pos(dir$, "porthack.exe") then goto 53
				
51				th_exec "pcrack " + hostahead$
				if th_haslogin(hostahead$) = 0 then goto 53
				goto 60 'Success
				
52				th_exec "pcrack " + hostahead$
				if th_haslogin(hostahead$) = 0 then goto 55
				goto 60 'Success
				
53				th_exec "porthack " + hostahead$
				if th_haslogin(hostahead$) = 0 then goto 55
				goto 60 'Success
				
				
				
				
                ' Ftp kits
                
                
                ' Reassure login, recrawl if needed
54              if th_haslogin(hostahead$) then th_exec ("rlogin " + hostahead$),out$ : ? out$ : goto 70
                beep
                ? rev$ bold$ red$ "Could't login into host. Host either block access or cancelled by user" reset$
                if hostahead$ = target$ then ? red$ under$ "Aborting since no way to host..." reset$ : beep : system
                ? "Avoiding " hostahead$
                
                ' Recrawl
                avoid$ = avoid$ + " " + hostahead$
55              th_exec ("uupath " + target$ + " " + avoid$), rawpath$
                if pos(rawpath$, "no path to host") = 0 then goto 57 'There is a definite path to host
                'If not, do exit and get new path        
                if th_re$( th_hostname$, "[^\s]+") <> "telehack" then avoid$ = avoid$ + " " + th_hostname$ : th_exec ("exit")
                goto 54

57              goto 35 'Rerun module 2
        

70          'Submodule 3.2: Check if connection timed out
                if pos(out$,"timed out") then goto 54 : ? under$ "Timed out... retrying" reset$ : goto 54
                goto 42

80          'Submodule 3.3: Check if connection timed out ( for direct login )
                if pos(out$,"timed out") then goto 41 : ? under$ "Timed out... retrying" reset$
                return
100 'Done
? rev$ bold$ under$ italic$ "Found path to host!" reset$
beep
th_exec ("cat *.sys")
end 
