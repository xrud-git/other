
rem For each line in: the file or all files in the folder .
rem 
rem %2 = pathToFile .
rem %3 = script for the 1st item :
rem 	!path_f! = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem %4 = script for the other items :
rem 	!path_f! = pathToFile .
rem 	!nu_f! = line number .
rem 	!v_f! = line text .
rem 
rem !nu_f! = last line number / amount of lines .
rem 
rem #group #array #count_lines #lines #file #file_read #fileRead #read #readFile #remove1stLine #remove_1stLine


call !en! checkFile "%~2"

if "!v_f!" equ "2" (
	
	rem [d] call !en! forEachFile 
	
	rem [d] call !en! forEachInFile 
	
) else (
	
	call !en! forEachInFile %*

)
