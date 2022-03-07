
`set /p` is limited to 1023 characters .

`>` doesn't: work with `(` and commands at all, like `<` .

```
(
	set /p "v_f="
	rem -- 1st input line .
	rem echo(1 !v_f!
	rem -- 1st output line .
	set /p "v_f="
	rem -- 2nd input line .
	rem echo(2 !v_f!
	rem -- 2nd output line .
) < t.txt > t1.txt
```	
