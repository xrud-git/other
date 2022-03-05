@rem @echo sc_en %*

@if "%~1" equ "" (


@echo off

set "en=%~f0"

rem # br :
rem setLocal enableDelayedExpansion
rem -- required . present in init_cmd_en, because otherwise `!br!` and other, wouldn't work in the script which uses cmd_en . #init
set br=^


rem # ;

rem [dev path_home]
rem call !en! sto "" "!v_f!"

echo(cmd_en loaded!br!
goto :eof


) else (
	
	set "v_f=D:\directories\cmdExe_add\cmd_en\storage"		&rem storage of the script files

	set "v1_f=D:\directories\cmdExe_add\cmd_en"		&rem cmd_en storage
	rem set "v1_f=!v1_f:~0,-1!"

	rem pushd !v_f!

	call "!v1_f!\sto_sho.cmd" %*

	exit /b

)
