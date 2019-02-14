@ECHO OFF
:start
SET choice=
SET /p choice=old computer [o] new computer [n]?: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='O' GOTO old
IF '%choice%'=='o' GOTO old
IF '%choice%'=='N' GOTO new
IF '%choice%'=='n' GOTO new
IF '%choice%'=='' GOTO end
ECHO "%choice%" is not valid
ECHO.
GOTO start

:old
@echo off

echo Making directories...
echo.
md %~dp0"%username%"
md %~dp0"%username%"\Favorites
md %~dp0"%username%"\Desktop
md %~dp0"%username%"\"Sticky notes"
md %~dp0"%username%"\MyDocuments
md %~dp0"%username%"\MyPictures
md %~dp0"%username%"\Music
md %~dp0"%username%"\Videos
if exist "%USERPROFILE%"\AppData\Local\Google\Chrome md %~dp0"%username%"\Chrome
if exist "%USERPROFILE%"\AppData\Local\Microsoft\Outlook\*.pst md %~dp0"%username%"\OutlookOLD


Title Transferring Files

echo Transferring Favorits...
xcopy "%USERPROFILE%"\Favorites\*.* %~dp0"%username%"\Favorites /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Desktop...
xcopy "%USERPROFILE%"\Desktop\*.* %~dp0"%username%"\Desktop /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Documents...
xcopy "%USERPROFILE%"\Documents\*.* %~dp0"%username%"\MyDocuments  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Pictures...
xcopy "%USERPROFILE%"\Pictures\*.* %~dp0"%username%"\MyPictures  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Music...
xcopy "%USERPROFILE%"\Music\*.* %~dp0"%username%"\Music  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Videos...
xcopy "%USERPROFILE%"\Videos\*.* %~dp0"%username%"\Videos  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Sticky Notes...
xcopy "%USERPROFILE%"\AppData\Roaming\Microsoft\"Sticky Notes"\*.* %~dp0"%username%"\"Sticky notes" /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Chrome Data...
if exist "%USERPROFILE%"\AppData\Local\Google\Chrome xcopy ""%USERPROFILE%"\AppData\Local\Google\Chrome\User Data\"*.* %~dp0"%username%"\Chrome  /E /I /C /Y /Z >nul 2>&1
echo.
echo Searching for PST file in an old location...
if exist "%USERPROFILE%"\AppData\Local\Microsoft\Outlook\*.pst xcopy "%USERPROFILE%"\AppData\Local\Microsoft\Outlook\*.pst %~dp0"%username%"\OutlookOLD\  /E /I /C /Y /Z >nul 2>&1
echo.

goto end

:new

@echo off

echo Making directories...
echo.
if exist %~dp0"%username%"\OutlookOLD md "%USERPROFILE%"\Documents\Outlook md "%USERPROFILE%"\Documents\Outlook\OLD


Title Transferring Files

echo Moving files...
echo.
echo Transferring Favorits...
xcopy %~dp0"%username%"\Favorites\*.* "%USERPROFILE%"\Favorites  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Desktop...
xcopy %~dp0"%username%"\Desktop\*.* "%USERPROFILE%"\Desktop  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Pictures...
xcopy %~dp0"%username%"\MyPictures\*.* "%USERPROFILE%"\Pictures  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Documents...
xcopy %~dp0"%username%"\MyDocuments\*.* "%USERPROFILE%"\Documents  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Music...
xcopy %~dp0"%username%"\Music\*.* "%USERPROFILE%"\Music  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Videos...
xcopy %~dp0"%username%"\Videos\*.* "%USERPROFILE%"\Videos  /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Sticky Notes...
xcopy %~dp0"%username%"\"Sticky notes"\*.* "%USERPROFILE%"\AppData\Roaming\Microsoft\"Sticky Notes"\ /E /I /C /Y /Z >nul 2>&1
echo.
echo Transferring Chrome Data...
if exist "%USERPROFILE%"\AppData\Local\Google\Chrome xcopy %~dp0"%username%"\Chrome\*.* ""%USERPROFILE%"\AppData\Local\Google\Chrome\User Data\"   /E /I /C /Y /Z >nul 2>&1
echo.
echo Searching for PST file in an old location...
if exist %~dp0"%username%"\OutlookOLD\*.pst xcopy %~dp0"%username%"\OutlookOLD\*.* "%USERPROFILE%"\Documents\Outlook\OLD  /E /I /C /Y /Z >nul 2>&1
echo.


goto cleanup 

:Cleanup
:: Removing the "%username%" files and Folder .

echo Deleting copied files...
del /f /s /q %~dp0"%username%" >nul 2>&1
echo.
rd /s /q %~dp0"%username%" >nul 2>&1



:end
echo Complete...
echo Press any key to exit...
pause>nul

