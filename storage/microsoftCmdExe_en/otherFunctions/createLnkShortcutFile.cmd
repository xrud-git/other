@echo off
setLocal enableDelayedExpansion enableExtensions

pushd "%~dp0"


echo(`call :cr_lnkFile "<<path (with file name)>>" "<<shortcut target path>>"` to do so


goto sto_func_end
	rem //# Create .lnk shortcut file
	:cr_lnkFile
		echo Set sto_WScript = WScript.CreateObject^("WScript.Shell"^) > %temp%\createShortcut.vbs
		echo Set link = sto_WScript.CreateShortcut^("%~1"^) >> %temp%\createShortcut.vbs
		echo link.TargetPath = "%~2" >> %temp%\createShortcut.vbs
		echo link.Save >> %temp%\createShortcut.vbs
		"%temp%\createShortcut.vbs"
		rem [dev ? cscript]
		rem wait until finished
		del "%temp%\createShortcut.vbs"
	goto :eof
:sto_func_end


popd

pause
rem exit /b
