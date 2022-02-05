@ECHO OFF
CLS
ECHO   --------------------------------------------------
ECHO     Choose Context Menu ( Right Click Menu ) Style 
ECHO   --------------------------------------------------
ECHO:
ECHO   1. Modern Windows 11 Context Menu
ECHO   2. Classic Windows 10 Context Menu
ECHO   3. EXIT
ECHO:

CHOICE /C 123 /M "Enter your choice: ---->"

:: INFO - Note that ERRORLEVELS are in a decreasing order.
IF ERRORLEVEL 3 GOTO EXIT
IF ERRORLEVEL 2 GOTO Classic--Windows-Context-Menu
IF ERRORLEVEL 1 GOTO Modern-Windows-Context-Menu

:: INFO -  First choice, New modern windows 11 context menu ( Right Click Menu ).
:Modern-Windows-Context-Menu
CLS
ECHO:
ECHO [WAARNING]   Note that windows eplorer will restart for changes to take effect,
Echo              if windows exeplorer didn't started automatically just reboot your computer

timeout /T 3

reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f

taskkill /f /im explorer.exe

start /min explorer.exe

GOTO End

:: INFO -  Second choice, New modern windows 11 context menu ( Right Click Menu ).
:Classic--Windows-Context-Menu
CLS
ECHO:
ECHO [WAARNING]   Note that windows eplorer will restart for changes to take effect,
Echo              if windows exeplorer didn't started automatically just reboot your computer

timeout /T 3

reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

taskkill /f /im explorer.exe

start /min explorer.exe
GOTO End

:: INFO - Third chioce, Exit script.
:EXIT
CLS
ECHO:
ECHO [EXIT] Goodbye!
timeout 2 > NUL
exit

:: INFO - Wait for any key to be pressed.
:End
pause