@echo off

set PkgPath=out\mediatek_linux\output\upgrade_loader.pkg
set RootPath1=Z:\HTV\2K15_L\devprod
set RootPath2=Y:\ktchen\HTV\devprod


:LOOP

set /p input=Enter ([1]:VM 2:134 server e:exit): 
echo start -- %time%
IF "%input%" == "e" GOTO END

IF NOT EXIST "F:\" GOTO NO_F

echo delay 5sec 
timeout /NOBREAK /T 5

echo del upgrade_loader.pkg
del F:\upgrade_loader.pkg

REM IF "%input%" == "2" GOTO COPY_359

IF "%input%"=="1" (
  set path=%RootPath1%\%PkgPath%
) ELSE IF "%input%"=="2" (
  set path=%RootPath2%\%PkgPath%
) ELSE (
  echo default seleted
  set path=%RootPath1%\%PkgPath%
)

echo %path%

if exist %path% (
  echo file exist!
  GOTO copy
) else (
  echo file no exist.
  GOTO LOOP
)

:copy
echo calling Fastcopy...[upgrade_loader.pkg]
D:\software\FastCopy211_x64\FastCopy.exe /estimate /auto_close /open_window /exclude=".svn\" %path% /to=F:\
GOTO EJECT

:EJECT

echo calling USB_Disk_Eject...
D:\software\USB_Disk_Eject.exe /SHOWEJECT /REMOVELETTER F

echo done -- %time%

GOTO LOOP

:NO_F
echo please insert F:
GOTO:LOOP

:END
