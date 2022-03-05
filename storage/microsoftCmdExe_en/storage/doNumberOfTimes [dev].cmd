

rem ! do not forget to not include `goto :eof` at end of the target script .
rem 
rem %2 : number_1, start the coordinate line with/from .
rem %3 : number_2, if its < than number_1 then do not do/repeat .
rem %4 : script
rem		!nu_f! -- number_1, its + 1 each repeat ;
rem			!!! idk if it has a limit, you can just `set "nu_f=0"` it each repeat .
rem 	!nu1_f! -- number_2 .
rem 	%%x -- number_1, such name/handle form is required for some functions .
rem 
rem !nu_f!, !nu1_f! .
rem 
rem #repeat #loop


set "nu_f=%~2"
set "nu1_f=%~3"

:f_doNumberOfTimes
if not !nu1_f! lss !nu_f! (
	rem echo(f_doNumberOfTimes !nu_f! !nu1_f! %*
	for %%x in (!nu_f!) do (
		%~4
	)
	set /a "nu_f= !nu_f! + 1"
	goto f_doNumberOfTimes
)


goto :eof
