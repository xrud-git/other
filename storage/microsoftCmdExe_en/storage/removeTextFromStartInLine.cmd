
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
	
	rem //# [1=]
	set "v1_f=!%~2:*%~3=!"
	
	call !en! countCharsInLine "%~3"
	call !en! removeFromStartInLine "%~2" "!v_f!"
	
	if "!v_f!" neq "!v1_f!" (
		set "v_f=!%~2!"
	)
	
)
