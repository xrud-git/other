
rem Result value is limited to max var size .
rem Escapes the value, see escapeVar script . (specifically newlines)
rem 
rem %2 = variable name .
rem %3 : (separator)
rem 	1. string/line to: check/search for, and remove .
rem 	2. variable name .
rem %4 = if "1", the %3 's 2nd option is used .
rem !v_f! = result .
rem 
rem #split

rem echo(# separateVar %*


call !en! escapeVar "%~2"
set "v_sc_f=!v_f!"

if "%~4" equ "1" (
	call !en! escapeVar "%~3"
) else (
	set "v_f=%~3"
)
rem //# required by [2] and [3]
if "!v_f!" equ "" (
	set "v_f=!v_sc_f!"
	goto :eof
)
set "v1_f="


rem //# [1] ver_StringManipulation
:f_separateVar
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!v_f!') do (
	set "v3_f=!v_sc_f!"
	set "v2_f=!v_sc_f:*%%x=!"
	
	if "!v2_f!" equ "" (
		rem //# required by [2]
		
		set "v1_f=!v1_f!!v_sc_f:%%x=!"
		rem //# [=3]
	) else (
		
		rem //# [2=]
		for /f usebackq^ tokens^=*^ delims^=^ eol^= %%y in ('!v2_f!') do (
			set "v1_f=!v1_f!!v_sc_f:%%x%%y=!!br!"
		)
		
		set "v_sc_f=!v2_f!"
		
		if "!v3_f!" neq "!v_sc_f!" (
			goto f_separateVar
		) else (
			set "v1_f=!v1_f:~0,-1!"
		)
	)
)
set "v_f=!v1_f!"


rem echo(# end separateVar
rem echo(!v_f!
rem echo(# ;


rem # info_dev
rem 
rem why-ever doesn't work
rem ```
rem for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('%~3') do (
rem 	set "v_f=%v_sc_f:%%x=!br!%"
rem )
rem 
rem set "v_f=%v_sc_f:%~3=!br!%"
rem ```


rem # sX

rem //# [1] ver_ForTokens [dev]
rem :f_escapeVar
rem for /f usebackq^ tokens^=1^,2*^ delims^=!v_f!^ eol^= %%x in ('!v_sc_f!') do (
rem 	echo t %%x %%y
rem )

rem # [1] ver_StringManipulation_min . may be not possible to make work with `!v_f!` == `!br!`
rem set "v1_f="
rem :f_separateVar
rem for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ('!v_f!') do (
rem 	set "v3_f=!v_sc_f!"
rem 
rem 	rem //# [3=]
rem 	set "v2_f=!v_sc_f:*%%x=!"
rem 
rem 	rem //# [2=]
rem 	for /f usebackq^ tokens^=*^ delims^=^ eol^= %%y in ('%%x!v2_f!') do (
rem 		set "v1_f=!v1_f!!v_sc_f:%%y=!!br!"
rem 	)
rem 
rem 	set "v_sc_f=!v2_f!"
rem )
rem if "!v_sc_f!" neq "" (
rem 	rem //# required
rem 	
rem 	if "!v3_f!" neq "!v_sc_f!" (
rem 		goto f_separateVar
rem 	)
rem 	set "v_f=!v1_f:~0,-1!"
rem ) else (
rem 	set "v_f=!v1_f:~0,-1!"
rem )
