
rem [dev_test]
rem ignores Tabs and Spaces at start and end of names, and at empty lines . and empty lines .
rem 
rem %2 = path to file .
rem %3 =  path to file with script .
rem * !v_f! = path to file with group .
rem %4 = group specifier (start of line) .
rem %5 -- optional, requires %6 (not "") and %7; value name . [=1]
rem %6 -- optional; path to file with script, that is processed between: %3 for the previous group, and -- for the one with the value .
rem * !v_f! = value at [1] .
rem %7 = optional; value name separator .
rem 
rem !v_f! = value .
rem 
rem 

echo(newlineSeparatedValues\each : %*


set "v1_sc_f="
set "st_sc_f=0"
set "v_s_sc_f="

call !en! sto "f" "txt"
set "path_sc_f=!v_f!"

for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
	
	set "v_sc_f=%%x"
	
	call :f_removeWhitespace_each_newlineSeparatedValues
	
	if not "!v_sc_f!" equ "" (
		
		call !en! removeTextFromStartInLine "v_sc_f" "%~4"
		rem value
			if "!v_f!" equ "!v_sc_f!" (
				
				(echo(!v_sc_f!)>>"!path_sc_f!"
				
				rem //# eachValue
					call !en! removeTextFromStartInLine "v_sc_f" "%~5"
					if not "!v_f!" equ "!v_sc_f!" (
						set "v_sc_f=!v_f!"
						call :f_removeWhitespace_each_newlineSeparatedValues
						call "%~6"
					)
				rem 
				
				set "st_sc_f=1"
				
		rem group
			) else (
				
				if "!st_sc_f!" equ "1" (
					set "v_f=!path_sc_f!"
					call "%~3"
					call !en! removeFile "!path_sc_f!"
				)		&rem (group with values)
				
				call !en! sto "f" "txt"
				set "path_sc_f=!v_f!"
				
				(echo(!v_sc_f!)>"!path_sc_f!"
				
				set "st_sc_f=1"
				
			)
	)
	
)

rem //# alone/last group
if "!st_sc_f!" equ "1" (
	set "v_f=!path_sc_f!"
	call "%~3"
	call !en! removeFile "!path_sc_f!"
)

goto :eof
:f_removeWhitespace_each_newlineSeparatedValues
call !en! removeTextFromStartInLine "v_sc_f" "	"
if not "!v_f!" equ "!v_sc_f!" (
	set "v_sc_f=!v_f!"
	goto f_removeWhitespace_each_newlineSeparatedValues
)
call !en! removeTextFromStartInLine "v_sc_f" " "
if not "!v_f!" equ "!v_sc_f!" (
	set "v_sc_f=!v_f!"
	goto f_removeWhitespace_each_newlineSeparatedValues
)
goto :eof
:end_f_removeWhitespace_each_newlineSeparatedValues
