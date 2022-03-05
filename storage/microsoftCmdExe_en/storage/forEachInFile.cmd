
rem For each line in: the file or all files in the folder .
rem 
rem %2 = pathToFile .
rem %3 = script for the 1st item :
rem 	%~f2 = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem %4 = script for the other items :
rem 	%~f2 = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem 
rem !nu_f! = last line number / amount of lines .
rem 
rem #group #array #count_lines #lines #file #file_read #fileRead #read #readFile #remove1stLine #remove_1stLine


set "nu_f=0"
for /f usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
	set /a "nu_f=!nu_f! + 1"
	set "v_f=%%x"
	%~3
	goto :f_forEachInFile
)

:f_forEachInFile
for /f skip^=1^ usebackq^ tokens^=*^ delims^=^ eol^= %%x in ("%~2") do (
	set /a "nu_f=!nu_f! + 1"
	set "v_f=%%x"
	%~4
)

goto :eof


rem # info_dev
rem 
rem require "usebackq", see forEach .
