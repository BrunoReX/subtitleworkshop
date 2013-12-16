@echo off

FOR /F "SKIP=1 DELIMS=" %%A IN ('WMIC CPU GET ADDRESSWIDTH') DO IF NOT DEFINED OS_ARCH SET OS_ARCH=%%A

SET DELPHI_PATH=%ProgramFiles%\Borland\Delphi7
IF %OS_ARCH%==64 SET DELPHI_PATH=%ProgramFiles(x86)%\Borland\Delphi7

"%DELPHI_PATH%\Bin\dcc32.exe" "SubtitleWorkshop.dpr"

PAUSE
