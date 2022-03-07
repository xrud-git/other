@if "%~1" equ "1" (
	!%~2!
	goto :eof
)
@setLocal enableDelayedExpansion enableExtensions
@call en
cd /d "%~dp0"





rem echo(!v_f!

rem pause
