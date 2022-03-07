
rem 
rem !! idk why, variables won't keep the values between repeats . but will output the last .
rem 
rem ! do not forget `goto :eof` at end of the target script .
rem 
rem %2 -- path to file with script
rem		!nu_f! -- number_1, its + 1 each repeat ;
rem			!!! idk if it has a limit, you can just `set "nu_f=0"` it each repeat .
rem 	!nu1_f! -- number_2 .
rem %3 -- number_2, if its < than number_1 then do not do/repeat .
rem %4 -- optional; number_1, start the coordinate line with/from;
rem * default: 1 .
rem 
rem !nu_f!
rem 
rem #repeat #loop


if "%~4" equ "" (
	set "nu_f=1"
) else (
	set "nu_f=%~4"
)
set "nu1_f=%~3"

:repeatNumberOfTimes
	if not !nu1_f! lss !nu_f! (
		rem echo(repeatNumberOfTimes !nu_f! !nu1_f! %*
		call "%~2"
		set /a "nu_f= !nu_f! + 1"
		goto repeatNumberOfTimes
	)
