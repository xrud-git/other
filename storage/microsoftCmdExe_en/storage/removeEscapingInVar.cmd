
rem Convert text with escaping, to array/text .
rem 
rem %2 = variable name .
rem !v_f! = text/array .
rem 
rem #input #parameters


set "v_sc_sc_f="
set "v2_sc_sc_f=^^^<^^^<__br^^^>^^^>"
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!%~2!') do (
	set "v1_sc_sc_f=%%x"
	
	rem [dev] maybe possible to avoid `!v2_sc_sc_f!`
	call !en! separateVar "v1_sc_sc_f" "v2_sc_sc_f" 1
	
	set "v_sc_sc_f=!v_sc_sc_f!!v_f!!br!"
)
set "v_f=!v_sc_sc_f:~0,-1!"


rem echo(removeEscapingInVar !v_f!
goto :eof


rem # info_dev
rem 
rem set "v=1 ^^^<^^^<__br^^^>^^^> 2"
rem set "v1=^^^<^^^<__br^^^>^^^>"
rem for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!v1!') do (
rem 	echo(!v! %%x
rem 	set "v=!v:*%%x=!"
rem )
rem echo(!v!
