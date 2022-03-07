
rem In file .
rem 
rem %~2 -- path to file .
rem %~3 -- number .
rem 
rem !v_f! -- pathToFile .
rem 
rem 

set "path_sc_sc_f=removeItemsFromEnd"


if "%~1" equ "!path_sc_sc_f!" (

	call !en! count "%~2"
	set /a "nu_sc_sc_f= !nu_f! - %~3 + 1"
	
	call !en! sto "f_!path_sc_sc_f!" "cmd"
	(echo(call "%~f0" 1 ^"^^^!v_f^^^!^"
	)>"!v_f!"
	set "v2_sc_sc_f="!v_f!""
	
	call !en! sto "f_!path_sc_sc_f!" "cmd"
	(echo(call "%~f0" 2 ^"^^^!v_f^^^!^"
	)>"!v_f!"
	set "v3_sc_sc_f="!v_f!""
	
	call !en! sto "!path_sc_sc_f!" "txt"
	set "v_sc_sc_f=!v_f!"
	
	call !en! forEachInFile "%~2" !v2_sc_sc_f! !v3_sc_sc_f!
	
	
	call !en! removeFile !v2_sc_sc_f!
	call !en! removeFile !v3_sc_sc_f!
	
	set "v_f=!v_sc_sc_f!"
	
)

if "%~1" equ "1" (
	(echo(%~2)>"!v_sc_sc_f!"
)

if "%~1" equ "2" (
	if !nu_f! lss !nu_sc_sc_f! (
		(echo(%~2)>>"!v_sc_sc_f!"
	)
)
