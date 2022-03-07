rem [forEachInFile] [ver_SetP]

rem For each line in the file .
rem !!! Is limited to 1024 characters per item/line .
rem 
rem %2 -- pathToFile .
rem %3 -- path to file with script :
rem 	!path_f! = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem %4 -- optional; amount of lines to process; if present, this script won't count all the lines .
rem 
rem !nu_f! = last line number / amount of lines .
rem 
rem #group #array #count_lines #lines #file #file_read #fileRead #read #readFile #remove1stLine #remove_1stLine

rem echo(forEachInFile : %*
set "path_sc_f=forEachInFile"


call !en! checkFile "%~2"

if "!v_f!" equ "1" (
	
	if "%~4" equ "" (
		call !en! count "%~2"
		set /a "nu_sc_f= !nu_f!"
	) else (
		set /a "nu_sc_f= %~4"
	)

	set "path_f=%~f2"
	set "nu_f=0"
	
	rem //# doesn't work with LineFeed-only newlines
	(
		for /l %%x in (1,1,!nu_sc_f!) do (
			set /a "nu_f=!nu_f!+1"
			set /p "v_f="
			rem echo(!nu_f! !v_f!
			call "%~3"
		)
	) < "%~2"

) else (
	echo(The file doesn't exist or is a folder.
)


rem # info_dev
rem 
