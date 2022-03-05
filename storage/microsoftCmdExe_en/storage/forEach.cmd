
rem For each -- line in the file; or File System item of the folder .
rem 
rem %2 = path to file/folder .
rem %3 = script/code .
rem %4 = if not nothing, then use %3 for the 1st item, and this for the other items .
rem 
rem !nu_f! = lineNumber .
rem 
rem #group #array
rem 
rem # info_dev
rem 
	rem doesn't support `for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("t.txt" "t1.txt")` because that require to process the string for `"` .
rem 


call !en! checkFile "%~2"
	
if "%~4" equ "" (
	
	if "!v_f!" equ "1" (
		call !en! forEachInFile "%~2" "%~3" "%~3"
	) else if "!v_f!" equ "2" (
		call !en! forEachFile "%~2" "%~3" "%~3"
	)
	
) else (
	
	if "!v_f!" equ "1" (
		call !en! forEachInFile "%~2" "%~3" "%~4"
	) else if "!v_f!" equ "2" (
		call !en! forEachFile "%~2" "%~3" "%~4"
	)
	
)
