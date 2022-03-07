rem [ver_1]

rem For each line in the file .
rem 
rem %2 -- pathToFile .
rem %3 -- path to file with script for the 1st item :
rem 	!path_f! = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem %4 -- path to file with script for the other items :
rem 	!path_f! = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem 
rem !nu_f! = last line number / amount of lines .
rem 
rem #group #array #count_lines #lines #file #file_read #fileRead #read #readFile #remove1stLine #remove_1stLine

rem echo(forEachInFile : %*


call !en! checkFile "%~2"

if "!v_f!" equ "1" (
	
	set "path_sc_f=%~f2"
	set "nu_f=0"

	for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
		set /a "nu_f=!nu_f! + 1"
		set "v_f=%%x"
		rem echo(%%x
		rem echo(1 !%~3!
		call "%~3"
	
		goto f_forEachInFile
	)

	:f_forEachInFile
		for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
			set /a "nu_f=!nu_f! + 1"
			set "v_f=%%x"
			rem echo(%%x
			rem echo(1 !%~4!
			call "%~4"
		)
		
) else (
	echo(The file doesn't exist or is a folder.
)


rem [dev]
rem 
rem //# seems fast enough, and unlimited .
rem type "%~2" | <<..>>
rem 


rem # info_dev
rem 
