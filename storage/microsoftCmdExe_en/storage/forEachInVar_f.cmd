
for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%y in ('!%~2!') do (
	set /a "nu_f=!nu_f! + 1"
	set "v_f=%%y"
	rem echo(%%y
	rem echo(2 %~4
	%~4
)
