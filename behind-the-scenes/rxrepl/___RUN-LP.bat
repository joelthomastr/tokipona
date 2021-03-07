:: linja pona (LP)

@echo off

setlocal enabledelayedexpansion

del _output-lp.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-LP.txt >nul 2>nul

:: replace block caps with cartouches

del LP-replace.txt >nul 2>nul

for /f "tokens=2,3* delims=," %%i in (_tpforeignwords.txt) do (
set string=%%i
set "string=[_!string: =_!]"
echo -s{%%j} -r{!string!}>>LP-replace.txt
)

rxrepl.exe -f _OUTPUT-LP.txt -a --options LP-replace.txt


:: make other changes

rxrepl.exe -f _OUTPUT-LP.txt -a --options OPTIONS-LP.txt

:: distribute span tags

rxrepl.exe -f _OUTPUT-LP.txt -a --options SPAN-TAGS.txt

:: cleanup

del LP-replace.txt 2>NUL
del *.bak*
