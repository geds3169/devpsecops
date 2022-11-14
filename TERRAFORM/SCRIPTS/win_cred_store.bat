@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------  

@echo off

echo "Store Vault Credentials"
echo.
echo.
echo "This program store credential to the current user profile"
echo.
if exist "%USERPROFILE%\.vault" goto yesfolder
if not exist "%USERPROFILE%\.vault" goto nofolder
goto end

:yesfolder
echo "DIRECTORY ALREADY EXISTS"
echo.
if exist "%USERPROFILE%\.vault\credentials" goto yesfile
if not exist "%USERPROFILE%\.vault\credentials" goto nofile
goto end

:nofolder
mkdir "%USERPROFILE%\.vault\"
echo.
echo "DIRECTORY CREATED %VAULT_CREDS%"
echo.
goto nofile

:yesfile
echo "THE CREDENTIAL FILE ALREADY EXISTS, CHECK IT MANUALY, %VAULT_CREDS%"
echo THE TOKEN CAN BE READ BY CALLING VAULT_TOKEN
echo.
goto end

:nofile
set /p VAULT_CREDS=Token:
echo=%VAULT_CREDS% >> %USERPROFILE%\.vault\credentials
setx VAULT_CREDS "%USERPROFILE%\.vault" /M
setX VAULT_TOKEN /F "%USERPROFILE%\.vault\credentials" /a 0,0 /M
echo "FOLDER & FILE CREATED,
echo "CREDENTIALS STORED IN %USERPROFILE%\.vault\credentials"
echo "TOKEN VARIABLE STORED %VAULT_TOKEN%, CAN BE CALLED BY THE VARIABLE $VAULT_TOKEN"
echo. 
goto end

:end
@pause
