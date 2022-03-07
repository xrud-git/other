rem @if "%microsoftCmdExe_debug%" gtr "0" (
rem 	echo sc_sto_sho
rem 	echo("%v_f%\%~1" %*
rem 	if "%microsoftCmdExe_debug%" gtr "1" (
rem 		pause
rem 	)
rem )


@rem ## info_dev
@rem 
	@rem 
	@rem calling "if"-s after any "if" with specifically broken code Block, will break the processing .
	@rem empty "(" .. ")" -s break script, add "rem " to them .
	@rem 
@rem ## ;

@set "v2_f="

@if "%~1" equ "file_cmd" (
	call %en% sto "%~2" "cmd"
	set "v2_f=2"
)
@if "%~1" equ "file_txt" (
	call %en% sto "%~2" "txt"
	set "v2_f=2"
)
@if "%~1" equ "deSto" (
	call %en% removeFile "%~2"
	set "v2_f=2"
)
@if "%~1" equ "delSto" (
	call %en% removeFile "%~2"
	set "v2_f=2"
)
@if "%~1" equ "for" (
	call %en% repeatNumberOfTimes "%~2" "%~3" "%~4"
	set "v2_f=2"
)
@rem @if "%~1" equ "loop" (
@rem 	call %en% repeat "%~2" "%~3" "%~4"
@rem 	set "v2_f=2"
@rem )
@if "%~1" equ "doNumberOfTimes" (
	call %en% repeatNumberOfTimes "%~2" "%~3" "%~4"
	set "v2_f=2"
)
@if "%~1" equ "countLinesInVar" (
	call %en% countInVar "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "countInFile" (
	call %en% count "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "countLinesInFile" (
	call %en% count "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "file" (
	call %en% checkFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "forEachLine" (
	call %en% forEachInVar "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "forEachLine_file" (
	call %en% forEachInFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "removeLinesFromEnd" (
	call %en% removeItemsFromEnd "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "removeLinesFromEndInVar" (
	call %en% removeItemsFromEndInVar "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "crFile" (
	call %en% makeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "newFile" (
	call %en% makeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "addFile" (
	call %en% makeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "deFile" (
	call %en% removeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "delFile" (
	call %en% removeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "deleteFile" (
	call %en% removeFile "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "removeEscapingFromVar" (
	call %en% removeEscapingInVar "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)
@if "%~1" equ "escapeNewlines" (
	call %en% escape "%~2" "%~3" "%~4" "%~5" "%~6"
	set "v2_f=2"
)


@if "%v2_f%" equ "" (
	call "%v_f%\%~1" %*
)
