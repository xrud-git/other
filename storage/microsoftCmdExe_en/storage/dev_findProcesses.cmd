
rem [dev]
rem 
rem %2 = Exe name [dev path] .
rem %3 -- optional; Window Title .
rem 
rem !v_f! -- PID ; or "" : not found .
rem 
rem 

rem echo(findProcesses : %*


call !en! sto "f" "txt"
set "v_sc_sc_f=!v_f!"

for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in (`tasklist /v /fo list /fi "IMAGENAME eq %~2"`) do (
	set "v_s_sc_sc_f=%%x"
	(echo(%%x)>>"!v_sc_sc_f!"
)

if not "%~3" equ "" (
	
	rem [dev_test] whyever `tasklist`\\`/fi "WINDOWTITLE eq %~3"` sometimes doesn't work
	
	
	call !en! sto "f" "cmd"
	set "v1_sc_sc_f=!v_f!"
	
	set "st_sc_sc_f=0"
	( echo(set ^"st_sc_sc_f=1^"
	)>"!v1_sc_sc_f!"
	
	
	call !en! sto "f" "cmd"
	set "v2_sc_sc_f=!v_f!"
	
	( echo(call ^^^!en^^^! dev_findProcesses_f
	)>"!v2_sc_sc_f!"
	
	
	call !en! "newlineSeparatedValues\each" "!v_sc_sc_f!" "!v2_sc_sc_f!" "Image Name" "%~3" "!v1_sc_sc_f!" ":   "
	
)

if "!v_s_sc_sc_f!" equ "!br!INFO: No tasks are running which match the specified criteria." (
	set "v_f="
) else (
	set "v_f=!v_sc_sc_f!"
)
