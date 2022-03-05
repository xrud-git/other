
rem 
rem 
rem %2 = variable name .
rem %3 = script for the 1st item :
rem 	!nu_f! = item number .
rem 	!v_f! = line text .
rem %4 = script :
rem 	!nu_f! = item number .
rem 	!v_f! = line text .
rem 
rem !nu_f! = last item number / amount of items .
rem 
rem #group #array #count_lines #lines #remove1stLine #remove_1stLine

rem echo(forEachInVar %*


set "nu_f=0"
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
	set /a "nu_f=!nu_f! + 1"
	set "v_f=%%x"
	rem echo(%%x
	rem echo(1 %~3
	%~3
	call !en! forEachInVar_f "%~2" "" "%~4"
	rem goto :eof
	
	rem goto f_forEachInVar
)
echo t1

rem :f_forEachInVar
rem for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
rem 	set /a "nu_f=!nu_f! + 1"
rem 	set "v_f=%%x"
rem 	rem echo(%%x
rem 	rem echo(2 %~4
rem 	%~4
rem )
rem goto :eof


rem # info_dev
rem 
rem "usebackq" is required at forEachInFile .
