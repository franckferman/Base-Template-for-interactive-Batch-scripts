@echo off
rem Basic template for interactive Batch scripts.

goto check_admin

:check_admin
net session>nul 2>&1
if %errorLevel%==0 (goto main) else (
echo Error, you must run this script with Administrator rights.
)
pause>nul
quit

:main
title Script name
cls
color 0a
echo ######## ########     ###    ##    ##  ######  ##    ##    
echo ##       ##     ##   ## ##   ###   ## ##    ## ##   ##     
echo ##       ##     ##  ##   ##  ####  ## ##       ##  ##      
echo ######   ########  ##     ## ## ## ## ##       #####       
echo ##       ##   ##   ######### ##  #### ##       ##  ##      
echo ##       ##    ##  ##     ## ##   ### ##    ## ##   ##     
echo ##       ##     ## ##     ## ##    ##  ######  ##    ##    
echo ######## ######## ########  ##     ##    ###    ##    ##   
echo ##       ##       ##     ## ###   ###   ## ##   ###   ##   
echo ##       ##       ##     ## #### ####  ##   ##  ####  ##   
echo ######   ######   ########  ## ### ## ##     ## ## ## ##   
echo ##       ##       ##   ##   ##     ## ######### ##  ####   
echo ##       ##       ##    ##  ##     ## ##     ## ##   ###   
echo ##       ######## ##     ## ##     ## ##     ## ##    ##   
echo.                                                                                               
echo We can only see a short distance ahead, but we can see plenty there that needs to be done...
echo.
pause
echo.
echo Welcome to my script.
echo.
echo 1 - Function number one.
echo 2 - Function number two.
echo 3 - Function number three.
echo 4 - Function number four
echo.
echo 9 - Quit the program.
echo.

set userchoice=
set /p userchoice=Your choice : 
if %userchoice%==1 goto function1 if NOT goto backtomain
if %userchoice%==2 goto function2 if NOT goto backtomain
if %userchoice%==3 goto function3 if NOT goto backtomain
if %userchoice%==4 goto function4 if NOT goto backtomain
if %userchoice%==9 goto quit if NOT goto backtomain

:error
cls
echo Sorry, an unexpected error was caused.
echo Do you want to try again or exit the program?
echo.
echo 1 - Back to main menu.
echo 2 - Quit the program. 
set erroruserchoice=
echo.
set /p erroruserchoice= Please make a choice : 
if %erroruserchoice%==1 goto backtomain if NOT goto backtomain
if %erroruserchoice%==2 goto quit if NOT goto backtomain

:backtomain
goto main

:quit
color F
cls
exit /b

:function1
cls
set ipaddr=
set /p ipaddr= Please enter the IP address of a machine or a site (for example, 192.168.0.1 or www.site.com) : 
ipaddr -4 -n 3 %ipaddr%
echo.
pause
cls
goto backtomain

:function2
cls
timeout /t 5
echo.
echo Flushing DNS cache, please wait...
timeout /t 10
echo.
ipconfig /flushdns 
echo.
timeout /t 5
echo.
echo ...
timeout /t 5
echo.
echo ...
timeout /t 5
echo.
echo Success.
echo.
pause
cls
goto backtomain

:function3
cls
nslookup myip.opendns.com resolver1.opendns.com
pause
goto backtomain

:function4
cls
pause
cls
goto backtomain
