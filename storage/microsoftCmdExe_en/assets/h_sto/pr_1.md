
```
@setLocal enableDelayedExpansion enableExtensions
@call en
cd /d "%~dp0"


set "v=t.txt"
set "sc=t1.cmd"


set "nu_f=0"
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("!v!") do (
	set /a "nu_f= !nu_f! + 1"
)
echo(!nu_f!
	
set "nu_sc_f=!nu_f!"
set "nu_f=0"

(
	for /l %%x in (1,1,!nu_sc_f!) do (
		set /a "nu_f=!nu_f!+1"
		set /p "v_f="
		echo(!nu_f! !v_f!
		
		rem //# doesn't work
		rem "!sc!"
	)
) < "!v!"


rem echo(!v_f!
pause
```
