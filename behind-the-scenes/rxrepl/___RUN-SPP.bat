:: sitelen pona pona (SPP)

@echo off

setlocal enabledelayedexpansion

del _output-spp.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-SPP.txt >nul 2>nul

:: distribute span tags

rxrepl.exe -f _OUTPUT-SPP.txt -a --options SPAN-TAGS.txt

:: apply changes
rxrepl.exe -f _OUTPUT-SPP.txt -a --options OPTIONS-SPP.txt

:: cleanup
del *.bak*
