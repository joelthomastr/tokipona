:: Latin (SI)

@echo off

setlocal enabledelayedexpansion

del _output-si.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-SI.txt >nul 2>nul

:: distribute span tags

rxrepl.exe -f _OUTPUT-SI.txt -a --options SPAN-TAGS.txt

:: replace block caps with sentence case
del SI-replace.txt 2>NUL

for /f "tokens=1,3* delims=," %%i in (_tpforeignwords.txt) do (
echo -s{%%j} -r{%%i}>>SI-replace.txt
)

rxrepl.exe -f _OUTPUT-SI.txt -a --options SI-replace.txt


:: apply other changes
rxrepl.exe -f _OUTPUT-SI.txt -a --options OPTIONS-SI.txt


:: cleanup
del SI-replace.txt 2>NUL
del *.bak*
