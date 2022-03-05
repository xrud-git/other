
rem Get information about file/folder
rem 
rem %2 = pathToFile .
rem 
rem !v_f! :
rem 	"" -- doesn't exist .
rem 	1 -- is a file .
rem 	2 -- is a folder .
rem 
rem Credits: https://stackoverflow.com/a/24032473/12669337 , Xrud .
rem 
rem #file #path #folder #directory


rem [d_t fileName]

set "v_f="
for %%x in ("%~2") do for /f "delims=r-" %%y in ("%%~ax%%~zx"
) do if "%%y"=="d" ( set "v_f=2" ) else ( set "v_f=1" )

goto :eof
