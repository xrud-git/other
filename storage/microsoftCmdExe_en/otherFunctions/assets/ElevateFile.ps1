<#
.SYNOPSIS
"Run as administrator" file at path .
.DESCRIPTION
All other parameters are passed to the file .
.PARAMETER cont_1
Path -- file to run .

0 -- output whether this script is run Elevated .
.NOTES
Version: 1.0

Credits: https://www.blogger.com/profile/05278298222887921824 , Xrud
.EXAMPLE
Microsoft Windows cmd.exe / Batch
```
setLocal enableDelayedExpansion

for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in (`powerShell -ExecutionPolicy RemoteSigned -Command ""%~dp0\assets\ElevateFile.ps1" 0 %*"`) do (
	if "%%x" equ "True" (
		echo(Was Elevated
	) else (
		echo(Wasn't Elevated
	)
)

rem //# Elevate if wasn't
	for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in (`powerShell -ExecutionPolicy RemoteSigned -Command ""%~dp0\assets\ElevateFile.ps1" "%~f0" %*"`) do (
		set "v_f=%%x"
		if "!v_f:~0,1!" equ "1" (
			goto :eof
		)
	)
rem 
```
.EXAMPLE
Microsoft Windows cmd.exe / Batch
```
rem //# Elevate if wasn't
powerShell -ExecutionPolicy RemoteSigned -Command ""%~dp0\assets\ElevateFile.ps1" "%~f0" %*" >nul
```
#>

param ($cont_1)

if ($cont_1 -eq 0) {
	([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')		# out
} else {
	$v1 = ''
	if ($args.count -gt 0) {
		$args | foreach {
			$v1 += "$_ "
		}
		$v1.remove($v1.Length - 1,1)
	}

	if ( ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator') ) {
		"0 ElevateFile: Didn't Elevate"		# out
	} else {
		# [dev] [1]
		if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
			if ($v1 -eq '') {
				Start-Process -FilePath $cont_1 -Verb Runas
			}else{
				Start-Process -FilePath $cont_1 -Verb Runas -ArgumentList $v1		# can output System.Diagnostics.Process with `-PassThru`
			}
			'1 ElevateFile: Did Elevate'		# out
		} else {
			# [dev] [=1]
			"2 ElevateFile: Can't elevate"		# out
		}
	}
}
