<div align=center><h3><b>
Enhancement for "cmd.exe"/Batch
</b></h3><b>
[microsoftCmdExe_en] [ver 0.9]

[English]
</b></div>


Please feel free to contribute .

Features
* Doesn't have other limitations than ones which is unavoidably forced by cmd.exe .
* [dev] Support for maximum amount of variative text characters ( most of other cmd scripts doesn't support some of them in variables, filenames, file content or/and other . even though its not prominent ) .
* Is an Open Source library .


## Usage

Not more than 8192 characters per text line of data .

You can save values with `"` to variables, but not pass them {to functions / as parameters} (if you try, they will be processed, and will not: work in all cases) .

To pass such value to function, its needed to
* Pass it by variable name .

	You could also escape `!` and use variable name as a call, but this works not always .
	```
	set "v1=1!br!2"
	set "v=call !en! forEachInVar "v1" "echo 3 4" "echo 5""

	call :sc "^!v^!"
	
	pause
	goto :eof
	:sc
		%~1
	goto :eof
	```

	If variable name is used as a call, the call won't: process `%%<<letter>>`, at the time when its expected to .

* Save it to file, and process the file from/using the function .

	```
	if "%~1" equ "1" (
		echo(%~2
		goto :eof
	)
	
	set "v=1!br!2"
	
	call !en! sto "f_sc" "cmd"
	echo(call "%~f0" 1 "^^^!v_f^^^!">"!v_f!"
	set "v_sc_f=!v_f!"
	
	call !en! forEachInVar "v" "!v_sc_f!" "!v_sc_f!"

	call !en! deSto "!v_sc_f!"
	
	pause
	```
	
Variables which was defined in functions (for example "v_f") can't pass the subject values by their variable names, to the other functions on same or upper level .

`<<br>>:<<name>>` Labels sometimes doesn't work in sequences of calls, with `call` and `goto` .


## init

Set relevant `v_f` and `v1_f` paths in the en.cmd .

### init_cmd_en

To load cmd_en -- before commands that require it, insert in {.cmd / .bat} that init the cmd instance/query
	( without: "rem" and optionally "	"/[/t (tabChar)]-s; and after newline/endOfLine ) --

* Without relevant item at Windows Path Environment Variable

	```
	@setLocal enableDelayedExpansion enableExtensions
	@set "v_f=%~dp0"
	@set "v_f=!v_f:~0,-1!"		&rem [dev path_home] current folder for results/output, for example Desktop . the default value is location of the file with init_cmd_en .
	@call "!v_f!\assets\en.cmd"		&rem <<if needed, change the path to be to the file>>
	rem !!! if the script file is executed trough Windows Symbolic Link, the `!v_f!` will target the storage folder of the link .
	```

* With relevant item at Windows Path Environment Variable

	```
	@setLocal enableDelayedExpansion enableExtensions
	@call "en.cmd"		&rem <<if needed, change the name to be of the file>>
	```

#initialization #installation


## Supported text characters

[d li]
```
<<[d]>>
```
