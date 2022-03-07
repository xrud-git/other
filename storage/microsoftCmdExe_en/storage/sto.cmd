
rem Creates a new storage file in: `%home%` , if it doesn't exist then -- `%temp%` .
rem 
rem ```
rem @if "%~1" equ "1" (
rem 	call "%~2"
rem 	goto :eof
rem )
rem @setLocal enableDelayedExpansion enableExtensions
rem @call en
rem 
rem call !en! sto "f_sc" "cmd"
rem ( echo(Escaping: ^^^! ^" ^^^) ^^^> ^^^> .
rem )>"!v_f!"
rem set "v_sc_f="!v_f!""
rem 
rem call "%~f0" 1 !v_sc_f!
rem 
rem call !en! deSto !v_sc_f!
rem ```
rem 
rem %2 -- optional; the file name will be `microsoftCmdExe_<<%~2>>_<<uniquing value>>.<<%~3>>` .
rem %3 -- optional; see %2 .
rem * nothing/default -- `txt` .
rem * [line]
rem * `.` -- nothing .
rem 
rem !v_f! -- path to file .
rem 
rem #temporal #store #storage

rem echo(sto : %*


set "v_sc_f="
set "nu_sc_f=0"

set "v1_sc_f=.%~3"
if "%~3" equ "" (
	set "v1_sc_f=.txt"
)
if "%~3" equ "." (
	set "v1_sc_f="
)


if "!home!" equ "" (
	set "v_sc_f=!temp!\microsoftCmdExe_%~2_"
) else (
	set "v_sc_f=!home!\microsoftCmdExe_%~2_"
)

:f_sto
	set /a "nu_sc_f= !nu_sc_f! + 1"
	call !en! checkFile "!v_sc_f!!nu_sc_f!!v1_sc_f!"
	if not "!v_f!" equ "" (
		goto f_sto
	)

call !en! makeFile "!v_sc_f!!nu_sc_f!!v1_sc_f!"
call !en! checkFile "!v_sc_f!!nu_sc_f!!v1_sc_f!"
if not "!v_f!" equ "1" (
	goto f_sto
)

set "v_f=!v_sc_f!!nu_sc_f!!v1_sc_f!"
