
rem 
rem 
rem [nothing]
rem 
rem !nu_f! -- 1 or 0 .
rem 
rem 

rem echo(isElevated %*


if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" (
	>nul 2>&1 "%windir%\SysWOW64\cacls.exe" "%windir%\SysWOW64\config"
) else (
	>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config"
)
if "%errorlevel%" equ "0" (
	set "nu_f=1"
) else (
	set "nu_f=0"
)


rem echo(!nu_f!
