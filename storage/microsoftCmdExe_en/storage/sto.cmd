
rem Creates a new storage file in: `%home%` , if it doesn't exist then -- `%temp%` .
rem 
rem %2 -- optional; the file name will be `microsoftCmdExe_<<%~2>>_<<uniquing value>>.<<%~3>>` .
rem %3 -- optional; default: `txt` .
rem * [line]
rem * `.` -- nothing .
rem 
rem !v_f! -- path to file .
rem 
rem #temporal #store #storage


set "v_sc_f="
set "nu_sc_f=1"

set "v1_sc_f=.%~3"
if "%~3" equ "" (
	set "v1_sc_f=.txt"
)
if "%~3" equ "." (
	set "v1_sc_f="
)


if "%home%" equ "" (
	set "v_sc_f=%temp%\microsoftCmdExe_%~2_"
) else (
	set "v_sc_f=%home%\microsoftCmdExe_%~2_"
)


:f_sto
	call !en! checkFile "!v_sc_f!!nu_sc_f!!v1_sc_f!"
	if not "!v_f!" equ "" (
		set /a "nu_sc_f= !nu_sc_f! + 1"
		goto f_sto
	)


call !en! makeFile "!v_sc_f!!nu_sc_f!!v1_sc_f!"

set "v_f=!v_sc_f!!nu_sc_f!!v1_sc_f!"


goto :eof
