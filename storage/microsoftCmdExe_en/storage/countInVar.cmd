
rem 
rem 
rem %~2 -- variable name .
rem 
rem !nu_f! -- number .
rem 
rem 

rem echo(countInVar %*


set "nu_f=0"
for /f tokens^=*^ delims^=^ eol^= %%x in ("!%~2!") do (
	set /a "nu_f= !nu_f! + 1"
)


rem echo(!nu_f!

goto :eof
