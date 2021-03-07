:: sitelen telo (ST)

@echo off

setlocal enabledelayedexpansion

del _output-st.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-ST.txt >nul 2>nul

:: distribute span tags

rxrepl.exe -f _OUTPUT-ST.txt -a --options SPAN-TAGS.txt

:: apply changes
rxrepl.exe -f _OUTPUT-ST.txt -a --options OPTIONS-ST.txt

:: cleanup
del *.bak*
