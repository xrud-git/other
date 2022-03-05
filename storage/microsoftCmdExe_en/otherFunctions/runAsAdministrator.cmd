@echo off
setLocal enableDelayedExpansion enableExtensions


rem //# "Run as administrator"
		if "!PROCESSOR_ARCHITECTURE!" equ "AMD64" (
			>nul 2>&1 "%windir%\SysWOW64\cacls.exe" "%windir%\SysWOW64\config"
		) else (
			>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config"
		)
		if "%errorlevel%" neq "0" (
			echo(Administrator access is required
			goto uacPrompt
		)
		goto end_uacPrompt
	:uacPrompt
		rem "%*" == all parameters . the space is somewhy required . [dev_s ?req `v_f = %*`]
			set "v_f=%*"
		set v_f=!v_f:"=""!
		rem "VBScript"
			echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
			echo UAC.ShellExecute "cmd.exe", "/c ""%~f0"" %v_f%", "", "runas", 1 >> "%temp%\getadmin.vbs"
		"%temp%\getadmin.vbs"
		rem [dev ? cscript]
		rem wait untill finished
		del "%temp%\getadmin.vbs"
		exit /b
	:end_uacPrompt

pushd "%~dp0"


rem //# "Run as administrator, Powershell"	[d cmd_en]
rem 	if "!PROCESSOR_ARCHITECTURE!" equ "AMD64" (
rem 		>nul 2>&1 "%windir%\SysWOW64\cacls.exe" "%windir%\SysWOW64\config"
rem 	) else (
rem 		>nul 2>&1 "%windir%\system32\cacls.exe" "%windir%\system32\config"
rem 	)
rem 	if "%errorlevel%" neq "0" (
rem 		echo(Administrator access is set to be requested
rem 		goto uacPrompt
rem 	)
rem 	goto end_uacPrompt
rem :uacPrompt
rem 	rem "%*" == all parameters . the space is somewhy required .
rem 		set "v_f=%*"
rem 		set v_f=!v_f:"=`"!
rem 	rem Powershell
rem 		echo if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {> "%temp%\getadmin.ps1"
rem 		echo Start-Process -FilePath "%~f0" -Verb Runas -ArgumentList "%v_f%">> "%temp%\getadmin.ps1"
rem 		echo }>> "%temp%\getadmin.ps1"
rem 		echo Exit>> "%temp%\getadmin.ps1"
rem 	powershell.exe "%temp%\getadmin.ps1"
rem 	rem wait untill finished
rem 	rem del "%temp%\getadmin.ps1"
rem 	exit /b
rem :end_uacPrompt


echo("Run as administrator" state


rem popd

pause
rem exit /b
