
rem 
rem 
rem %~2 -- variable name .
rem %~3 -- number .
rem %~4 -- optional; separator to use, by default newline is used (same as at the input) .
rem 
rem !v_f! -- text .
rem 
rem 

set "path_sc_sc_f=removeItemsFromEndInVar"
rem echo(!path_sc_sc_f! : %*


if "%~1" equ "!path_sc_sc_f!" (

	if "%~4" equ "" (
		set "v1_sc_sc_f=!br!"
	) else (
		set "v1_sc_sc_f=%~4"
	)

	call !en! countInVar "%~2"
	set /a "nu_sc_sc_f= !nu_f! - %~3 + 1"

	call !en! sto "f_!path_sc_sc_f!" "cmd"
	(echo(call ^"%~f0^" 1 ^"^^^!v_f^^^!^"
	)>"!v_f!"
	set "v2_sc_sc_f=!v_f!"
	
	call !en! sto "f_!path_sc_sc_f!" "cmd"
	(echo(call ^"%~f0^" 2 ^"^^^!v_f^^^!^"
	)>"!v_f!"
	set "v3_sc_sc_f=!v_f!"
	
	set "v_sc_sc_f="
	call !en! forEachInVar "%~2" !v2_sc_sc_f! !v3_sc_sc_f!
	
	
	call !en! removeFile !v2_sc_sc_f!
	call !en! removeFile !v3_sc_sc_f!
	
	set "v_f=!v_sc_sc_f!"
	
)

if "%~1" equ "1" (
	set "v_sc_sc_f=%~2"
)

if "%~1" equ "2" (
	if !nu_f! lss !nu_sc_sc_f! (
		set "v_sc_sc_f=!v_sc_sc_f!!v1_sc_sc_f!%~2"
	)
)
