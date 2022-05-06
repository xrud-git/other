@echo off
setLocal enableExtensions enableDelayedExpansion


rem echo(
rem echo(( ^\^|^/ you could drag the <<_>> onto this file ^)

set "v_s=<<path>>"
echo(
echo(Default path to the <<_>>: !v_s!
echo(
set /p v=Press Enter for def, or write other path: 
if "!v!" equ "" (
	set "v=!v_s!"
)


pause