
rem 
rem 
rem %2 = variable name .
rem %3 = path to file with script for the 1st item :
rem 	!nu_f! = item number .
rem 	!v_f! = line text .
rem %4 = path to file with script :
rem 	!nu_f! = item number .
rem 	!v_f! = line text .
rem 
rem !nu_f! = last item number / amount of items .
rem 
rem #group #array #count_lines #lines #remove1stLine #remove_1stLine

rem echo(forEachInVar %*


rem [dev_s]
rem if "%~4" equ "" (
rem 	set "v1_f=%~3"
rem ) else (
rem 	if "%~4" equ "." (
rem 		set "v1_f=%~3"
rem 	) else (
rem 		set "v1_f=%~4"
rem 	)
rem )


set "nu_f=0"
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
	set /a "nu_f=!nu_f! + 1"
	set "v_f=%%x"
	rem echo(%%x
	rem echo(1 %~3
	call "%~3"
	goto f_forEachInVar
)

:f_forEachInVar
	for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%y in ('!%~2!') do (
		set /a "nu_f=!nu_f! + 1"
		set "v_f=%%y"
		rem echo(%%y
		rem echo(2 %~4
		call "%~4"
	)
	goto :eof


rem # info_dev
rem 
