:: sitelen pilin (SE)

@echo off

setlocal enabledelayedexpansion

del _output-se.txt >nul 2>nul
copy _INPUT.txt _OUTPUT-SE.txt >nul 2>nul

:: distribute span tags

rxrepl.exe -f _OUTPUT-SE.txt -a --options SPAN-TAGS.txt

:: prepare to replace words with emojis

del SE-add-tags.txt >nul 2>nul

for /f "tokens=2,3* delims=," %%i in (_tpforeignwords.txt) do echo -s[%%j] -r[cartouchesymbol %%i cartouchesymbol]>>SE-add-tags.txt

set "seaddtags=-s{[^^a-z]+\K("
for /f "tokens=1,2* delims=," %%i in (_tpconversion.txt) do set "seaddtags=!seaddtags!%%i^^|" 
set "seaddtags=%seaddtags:~0,-1%"
set "seaddtags=%seaddtags%)(?=[^^a-z])} -r{ytpy\1ztpz}"
echo %seaddtags%>>SE-add-tags.txt

echo -s{ztpz\.} -r{ztpzytpypfullstopztpz}>>SE-add-tags.txt
echo -s{ztpz:} -r{ztpzytpypcolonztpz}>>SE-add-tags.txt

rxrepl.exe -f _OUTPUT-SE.txt -a --options SE-add-tags.txt

:: apply other changes

rxrepl.exe -f _OUTPUT-SE.txt -a --options OPTIONS-SE.txt

:: replace tagged words with emojis

del SE-conversion.txt 2>nul
for /f "tokens=1,2* delims=," %%i in (_tpconversion.txt) do echo -s[ytpy%%iztpz] -r[%%j]>>SE-conversion.txt
echo -s[^>^<^/i^> ^<i] -r[^>^<^/i^>^<i]>>SE-conversion.txt
echo -s[ytpy] -r[]>>SE-conversion.txt
echo -s[ztpz] -r[]>>SE-conversion.txt
rxrepl.exe -f _OUTPUT-SE.txt -a --options SE-conversion.txt




:: edit span tagged
:: echo on
:: rxrepl.exe -f _OUTPUT-SE.txt -a -s "span class=\x22lp\x22" -r "span class=\x22se\x22"


:: cleanup

del SE-add-tags.txt 2>NUL
del SE-conversion.txt 2>NUL
del *.bak*
