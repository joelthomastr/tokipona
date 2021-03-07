:: English (EN)

@echo off

setlocal enabledelayedexpansion

del _output-en.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-EN.txt >nul 2>nul

:: distribute span tags

rxrepl.exe -f _OUTPUT-EN.txt -a --options SPAN-TAGS.txt

:: replace block caps with sentence case
del EN-replace.txt 2>NUL

for /f "tokens=1,3* delims=," %%i in (_tpforeignwords.txt) do (
echo -s{%%j} -r{%%i}>>EN-replace.txt
)


rxrepl.exe -f _OUTPUT-EN.txt -a --options EN-replace.txt


:: replace _LANGCODE with _en

rxrepl.exe -f _OUTPUT-EN.txt -a --options OPTIONS-EN.txt

:: cleanup

del EN-replace.txt 2>NUL
del *.bak*
