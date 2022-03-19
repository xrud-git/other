rem 
rem 
rem %~2 -- variable name .
rem 
rem !v_f! -- number .
rem 
rem #size #length

rem echo(countCharsInVar : %*


set "v1_f=!%~2!."
set "v_f=0"
for %%x in (8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if not "!v1_f:~%%x,1!" equ "" (
		set /a "v_f= !v_f! + %%x"
		set "v1_f=!v1_f:~%%x!"
	)
)


rem echo(!v_f!
