rem echo sc_sto_sho
rem echo "!v_f!\%~1" %*

rem ## info_dev
	rem 
	rem calling "if"-s after any "if" with specifically broken code Block, will break the processing .
	rem empty "(" .. ")" -s break script, add "rem " to them .
	rem 
rem 


if "%~1" equ "deSto" (

	call !en! removeFile "%~2"
	
	goto :eof
)
if "%~1" equ "delSto" (

	call !en! removeFile "%~2"
	
	goto :eof
)
if "%~1" equ "for" (

	call !en! repeatNumberOfTimes "%~2" "%~3" "%~4"
	
	goto :eof
)
if "%~1" equ "repeatNumberOfTimes" (

	call !en! doNumberOfTimes "%~2" "%~3" "%~4"
	
	goto :eof
)
if "%~1" equ "countLinesInVar" (
	
	call !en! countInVar "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "file" (
	
	call !en! checkFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "forEachLine" (
	
	call !en! forEachInVar "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "forEachLine_file" (
	
	call !en! forEachInFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "forEachInFiles" (
	
	call !en! forEachInFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "crFile" (
	
	call !en! makeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "newFile" (
	
	call !en! makeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "addFile" (
	
	call !en! makeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "deFile" (
	
	call !en! removeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "delFile" (
	
	call !en! removeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "deleteFile" (
	
	call !en! removeFile "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "removeEscapingFromVar" (
	
	call !en! removeEscapingInVar "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)
if "%~1" equ "escapeNewlines" (
	
	call !en! escape "%~2" "%~3" "%~4" "%~5"
	
	goto :eof
)


rem //# if no function was processed: no `goto :eof` was executed, so getting here
call "!v_f!\%~1" %*
