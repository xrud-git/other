@echo off
setLocal enableExtensions enableDelayedExpansion


goto end_uacPrompt

rem //# "Run as administrator"	[d cmd_en]
	if "!PROCESSOR_ARCHITECTURE!" equ "AMD64" (
		>nul 2>&1 "%windir%\SysWOW64\cacls.exe" "%windir%\SysWOW64\config"
	) else (
		>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config"
	)
	if "%errorlevel%" neq "0" (
		echo(Administrator access is set to be requested
		goto uacPrompt
	)
	goto end_uacPrompt
:uacPrompt
	rem "%*" == all parameters . the space is somewhy required .
		set "v_f=%*"
		set v_f=!v_f:"=`"`"`"!
	rem Powershell
		echo if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {> "%temp%\getadmin.ps1"
		echo Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "`"%~dp0\other\assets\f_editSymbolicLink.ps1`" !v_f!">> "%temp%\getadmin.ps1"
		echo }>> "%temp%\getadmin.ps1"
		echo Exit>> "%temp%\getadmin.ps1"
	powershell.exe "%temp%\getadmin.ps1"
	rem wait until finished
	rem del "%temp%\getadmin.ps1"
	exit /b
:end_uacPrompt


powerShell -file "%~dp0assets\f_editSymbolicLink.ps1" "%~1"
