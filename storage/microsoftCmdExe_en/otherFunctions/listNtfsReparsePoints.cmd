@echo off
setLocal enableExtensions enableDelayedExpansion
set br=^


rem br;
pushd "%~dp0"		&rem Working/{temp files} Directory . pat>->paf ;

if "%~1" equ "" echo(Drag the target folder onto the .cmd .!br!

dir /al /s "%~1"

pause
