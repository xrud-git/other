@echo off
setLocal enableDelayedExpansion


rem //# Elevate if wasn't
	for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in (`powerShell -ExecutionPolicy RemoteSigned -Command ""%~dp0assets\ElevateFile.ps1" "%~f0" %*"`) do (
		set "v_f=%%x"
		if "!v_f:~0,1!" equ "1" (
			goto :eof
		)
	)
rem 


echo(
pause
