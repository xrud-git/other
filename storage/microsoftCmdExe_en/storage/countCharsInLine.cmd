
rem 
rem 
rem %~2 -- variable name .
rem 
rem !nu_f! -- number .
rem 
rem #size #length

rem echo(countCharsInLine : %*


set "v_f="
set "nu_f=0"
for %%x in (8192, 4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if not "!v_f:~%%x,1!" equ "" (
		set /a "nu_f= !nu_f! + %%x"
		set "v_f=!v_f:~%%x!"
	)
)


rem echo(!nu_f!
