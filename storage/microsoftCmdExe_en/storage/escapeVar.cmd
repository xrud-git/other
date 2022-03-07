
rem Do escape on content of the variable, see the escape script description .
rem Result is limited to the max var size, [dev_1 save to file] and the escaped values take more space than not escaped .
rem 
rem %2 = variable name .
rem !v_f! = escaped text/array .
rem 
rem #input #parameters


set "v_f="
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
	set "v_f=%%x"
	goto :f_escapeVal
)
:f_escapeVal
for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
	set "v_f=!v_f!^^^^^^^<^^^^^^^<__br^^^^^^^>^^^^^^^>%%x"
)


rem echo(escapeVar !v_f!
