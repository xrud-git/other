<div align=center><h3><b>
Enhancement for "cmd.exe"/Batch
</b></h3><b>
[microsoftCmdExe_en] [ver_0_10]

[English]
</b></div>


Please feel free to contribute .

Features
* [dev] Doesn't have other limitations than ones which are unavoidably forced by cmd.exe .
* Is an Open Source library under Xrud authority .

For development info and support see [v_dev](v_dev) .

For cmd and cmd_en documentation see [info](info.md) .


## Usage

Not more than 8184 characters per text line of data . Escaping -- `` ^! %% ^^ ^& ^* ^= ^' ^" ^| ^, ^< ^> `` .

!! Do not forget to delete files/storages, paths to which, result from functions .

!! `!v_f!` is overwritten at each of the calls, do not use it to pass values to the functions . (because these can use the other functions)

You can save values with `"` to variables, but to pass them {to functions / as parameters}, pass them by variable name .

If you want to pass script, save it to file, and process the file from/using the function . This is the only consistent way, see [info](info.md) for more .
```
@if "%~1" equ "1" (
	echo(%~2
	goto :eof
)
@setLocal enableDelayedExpansion enableExtensions
@call en

call !en! sto "f_sc" "cmd"
( echo(call "%~f0" 1 "^^^!v_f^^^!"
)> "!v_f!"
set "v_sc_f=!v_f!"

call :sc "!v_f!"

call !en! removeFile "!v_sc_f!"

pause
goto :eof
:sc
	set "v_f=1 2"
	call "%~1"
	goto :eof
```
* For the functions, we limited passing scripts, to files only -- so you wouldn't have to: add `call ` the most of times, see [info\\#1](info.md) .

To write/save something to file, you should always use
```
(<<optional whitespace>>echo(rem Escaping: ^^^! ^" ^^^) ^^^> ^^^> .
)<<`>` or {`>` + `>`}>> "<<path>>"
```
* otherwise it'll be needed to escape number at end of the line .

Variables which was defined in functions (for example "v_f") can't pass the subject values by their variable names, to the other functions on same level, can can to -- Ones on the higher level [dev next or all] .


## init

Set relevant `v_f` and `call` paths in the en.cmd .

### init_cmd_en

To load cmd_en -- before commands that require it, insert in {.cmd / .bat} that init the cmd instance/query
	( without: "rem" and optionally "	"/[/t (tabChar)]-s; and after newline/endOfLine ) --

* Without relevant item at Windows Path Environment Variable

	```
	@setLocal enableDelayedExpansion enableExtensions
	@set "v_f=%~dp0"
	@set "v_f=!v_f:~0,-1!"		&rem [dev path_home] current folder for results/output, for example Desktop . the default value is location of the file with init_cmd_en .
	@call "!v_f!\assets\microsoftCmdExe_en\en.cmd"		&rem <<if needed, change the path to be to the file>>
	rem !!! if the script file is executed trough Windows Symbolic Link, the `!v_f!` will target the storage folder of the link .
	```

* With relevant item at Windows Path Environment Variable

	```
	@setLocal enableDelayedExpansion enableExtensions
	@call "en.cmd"		&rem <<if needed, change the name to be of the file>>
	```

#initialization #installation


## Other

### Supported text characters

[d li]
```
<<[d]>>
```

