@echo off
rem A template for creating interactive batch scripts.

net session>nul 2>&1
	if %errorLevel%==0 (goto main) else (
	color 4
	echo Administrator rights are required to run this script properly.
	echo.
	pause
	goto quit
)

:main
cls
title Interactive Batch script template
color 0a
echo ######## ########     ###    ##    ##  ######  ##    ##    
echo ##       ##     ##   ## ##   ###   ## ##    ## ##   ##     
echo ##       ##     ##  ##   ##  ####  ## ##       ##  ##      
echo ######   ########  ##     ## ## ## ## ##       #####       
echo ##       ##   ##   ######### ##  #### ##       ##  ##      
echo ##       ##    ##  ##     ## ##   ### ##    ## ##   ##     
echo ##       ##     ## ##     ## ##    ##  ######  ##    ##
echo.
echo ######## ######## ########  ##     ##    ###    ##    ##   
echo ##       ##       ##     ## ###   ###   ## ##   ###   ##   
echo ##       ##       ##     ## #### ####  ##   ##  ####  ##   
echo ######   ######   ########  ## ### ## ##     ## ## ## ##   
echo ##       ##       ##   ##   ##     ## ######### ##  ####   
echo ##       ##       ##    ##  ##     ## ##     ## ##   ###   
echo ##       ######## ##     ## ##     ## ##     ## ##    ##
echo.
pause
echo.
echo Lorem ipsum dolor sit amet. 
echo.
echo 1 - First function example: Ping.
echo 2 - Second function example: FlushDNS.
echo 3 - Third function example: Show date.
echo 4 - Fourth function example: Assign a network drive.
echo.
echo 9 - Leave the program.
echo.

set userchoice=
set /p userchoice=Your choice: 
if %userChoice%==1 goto firstFunction if NOT goto BackTomain
if %userChoice%==2 goto secondFunction if NOT goto BackTomain
if %userChoice%==3 goto thirdFunction if NOT goto BackTomain
if %userChoice%==4 goto fourthFunction if NOT goto BackTomain
if %userChoice%==9 goto quit if NOT goto BackTomain

:error
cls
color 4
echo An unexpected error was caused.
echo.
echo Which choice do you want to make?
echo.
echo 1 - Back to main menu.
echo 2 - Quit the program.
echo.
set erroruserchoice=
set /p erroruserchoice= Please make a choice: 
if %erroruserchoice%==1 goto BackTomain if NOT goto quit
if %erroruserchoice%==2 goto quit if NOT goto BackTomain

:BackTomain
goto main

:quit
cls
color 7
exit /b

:firstFunction
cls
color 7
set ipAddr=
set /p ipAddr=Enter the IP address of a machine, the name of a machine or a website (for example 192.168.0.1 or github.com): 
ping -4 -n 4 %ipAddr%
echo.
pause
cls
goto BackTomain

:secondFunction
cls
color 7
echo Start the DNS flushing process.
timeout /t 5
ipconfig /flushdns 
timeout /t 5
echo.
echo DNS flushing process successfully completed.
echo.
pause
goto BackTomain

:thirdFunction
cls
color 7
echo We are on %date%, and it is %time%.
echo.
pause
goto BackTomain

:fourthFunction
cls
color 7

set NetworkDrive=
set /p NetworkDrive=What letter do you want to use for the network drive (for example x, y or z...): 

net use %NetworkDrive%: /delete
net use %NetworkDrive%: \\ip\folder /user:username password /p:yes
rem /p:yes=reconnection at startup

pause
goto BackTomain
