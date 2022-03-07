@setLocal enableDelayedExpansion enableExtensions
@call en
cd /d "%~dp0"


set "v=1"

call !en! file_cmd
(
	echo(echo("%%v%%"
	echo(set "v=3"
	echo(goto :eof
)>"!v_f!"
echo("!v_f!"
set "v1=!v_f!"

call !en! file_cmd
(
	echo(echo(t "^!v^!"
	echo(set "v=2"
	echo(call "!v1!"
)>"!v_f!"
rem echo(pause>>"!v_f!"
echo(goto :eof>>"!v_f!"
echo("!v_f!"


rem "!v_f!"

echo("!v!"


echo end
