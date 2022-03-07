@rem @echo sc_en %*

@if "%~1" equ "" (

echo off

set "en="%~f0""

rem //# br
rem ## Lf :
rem setLocal enableDelayedExpansion
rem -- required . present in init_cmd_en, because otherwise `!br!` and other, wouldn't work in the script which uses cmd_en . #init
set Lf=^


rem ## ;
for /f %%x in ('copy /Z "%~f0" nul') do set "Cr=%%x"
set "br=!Cr!!Lf!"


rem set "microsoftCmdExe_debug=0"

rem [dev path_home]
rem call !en! sto "" "!v_f!"


echo(cmd_en loaded!br!
goto :eof

) else (
	
	set "v_f=D:\directories\cmdExe_add\cmd_en\storage"		&rem storage of the script files . some functions need it to not end on `\` .

	call "%~dp0en_sto_sho.cmd" %*

	rem call "D:\directories\cmdExe_add\cmd_en\storage\%~1" %*

)
