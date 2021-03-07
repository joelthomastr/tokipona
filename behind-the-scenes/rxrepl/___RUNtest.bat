setlocal enabledelayedexpansion

:: sitelen pilin section (SE)

:: prepare files

del _output-se.txt
del _SE-add-tags.tx*

echo off
set "seaddtags=-s[("
for /f "tokens=1,2* delims=," %%i in (_tpconversion.txt) do set "seaddtags=!seaddtags!%%i^^|"

set "seaddtags=%seaddtags:~0,-1%"
set "seaddtags=%seaddtags%)] -r[ytpy\1ztpz]"
echo %seaddtags%

pause

exit

echo )] -r[ytpy\1ztpz] >>_SE-add-tags.txt
rxrepl.exe -f _SE-add-tags.txt -a -s " \r\n" -r "|"
rxrepl.exe -f _SE-add-tags.txt -a -s "\(\|" -r "("
rxrepl.exe -f _SE-add-tags.txt -a -s "\|\)" -r ")"
rxrepl.exe -f _SE-add-tags.txt -a -s "\]\|" -r "]"