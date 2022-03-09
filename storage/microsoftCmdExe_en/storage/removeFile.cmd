
rem 
rem 
rem %2 -- path .
rem 
rem #files #remove #remove_files #de_files #deFiles

rem echo(do?: removeFile : %*
rem pause


if "%~2" neq "" (
	del /f "%~2"
)

