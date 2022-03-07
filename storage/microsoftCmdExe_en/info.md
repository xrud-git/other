
# Assets

for variable names, each function uses `_f` at the end, or `f_` at the start . starting from function with only 1 such, each parent level in intended to add a new `_sc` before the mark at end, and each sub-level -- `_f` .

`for /f` require `usebackq` for files .

`set /p` is limited to 1023 characters .

Few functions doesn't support LineFeed-only breaks and will process such values/files -- with issues .


## Execution

`:eof` -- end of the input script (sequence of commands) .

Call -- `goto :eof` sometimes ends the whole sequence of `call` -s . but it closes scripts, and not cmd -s .

`<<newline>>"<<path to script>>"` doesn't work in some Blocks, see [example](assets\h_sto\pr_1.md) . #1

Start new cmd --
* With the same variables storage :
	* Asynchronously :

		* And do not close after reaching 1st eof :

			* And, each line, switch the input between it and other cmd -s in the same window : `start /b "" "<<pathToFile>>" <<parameters ..>>` or `start /b <<command>> <<parameters ..>>` .
			* In a new window -- `start "" "<<pathToFile>>" <<parameters ..>>` or `start <<command>> <<parameters ..>>` .

				Also : `/min` . "CTRL+C to terminate" .
			
			Can be closed with `exit /b` . "CTRL+BREAK to terminate" .

	* Pause the script and do so :

		* And do not close after reaching 1st eof :

			* `start /wait /b "" "<<pathToFile>>" <<parameters ..>>` or `start /wait /b <<command>> <<parameters ..>>` .
			* In a new window -- `start /wait "" "<<pathToFile>>" <<parameters ..>>` or `start /wait <<command>> <<parameters ..>>` .
			
				Also : `/min` . "CTRL+C to terminate" .
		
			Can be closed with `exit`/`exit /b` , in that case asks whether to continue processing the script . "CTRL+BREAK to terminate" .

* Other :

	```
	cmd /q /e:on /v:on <<path to .cmd and `call <<path to .cmd>>` doesn't do anything>>
	```

`<<br>>:<<name>>` Labels is 1 of the 1st things to break if script has any issues .


### Function parameters

In many cases, `"call "%~2" "%~1""` doesn't work .

If you pass commands/scripts by variable name

```
@if "%~1" equ "1" (
	!%~2!
	goto :eof
)
@setLocal enableDelayedExpansion enableExtensions
@call en

set "v=echo 1 2"
call "%~f0" 1 "v"

pause
```

* Sometimes certain of the commands won't work .
* You need to pass `call <<path>>`/`start "" "<<pathToFile>>" <<parameters ..>>` , to process files . See #1 .
* You could also escape `!` , to use variable name as a call . But `^!` sometimes doesn't work in that case .

	Also, the call won't: process `%%<<letter>>` , at the time when its expected to .
