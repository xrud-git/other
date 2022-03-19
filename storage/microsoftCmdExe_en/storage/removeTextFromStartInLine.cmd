
rem 
rem 
rem %~2 -- variable name .
rem %~3 -- text line .
rem 
rem !v_f! -- text line .
rem 
rem 

rem echo(removeTextFromStartInLine : %*


if "%~3" equ "" (
	rem //# req by [1]
	
	set "v_f=!%~2!"
) else (
	
	set "v_sc_f=%~3"
	call !en! countCharsInVar "v_sc_f"
	call !en! removeFromStartInLine "%~2" "!v_f!"
	
	rem //# [1=]
	set "v_sc_f=!%~2:*%~3=!"
	
	if "!v_f!" neq "!v_sc_f!" (
		set "v_f=!%~2!"
	)
	
)


rem echo(!v_f!
