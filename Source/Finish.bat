@echo off

SET UPX_PATH=C:\Others\UPX\upx.exe

REM Get SubtitleAPI path
CD %~dp0\..
SET SUBAPI_PATH=%CD%\SubtitleAPI
CD %~dp0

FOR /F "SKIP=1 DELIMS=" %%A IN ('WMIC CPU GET ADDRESSWIDTH') DO IF NOT DEFINED OS_ARCH SET OS_ARCH=%%A

SET DELPHI_PATH=%ProgramFiles%\Borland\Delphi7
IF %OS_ARCH%==64 SET DELPHI_PATH=%ProgramFiles(x86)%\Borland\Delphi7

"%DELPHI_PATH%\Bin\dcc32.exe" "%SUBAPI_PATH%\SubtitleWorkshop.dpr"
"%DELPHI_PATH%\Bin\dcc32.exe" "%~dp0\SubtitleWorkshop.dpr"

IF EXIST "%UPX_PATH%" GOTO UPX_COMPRESS
GOTO END

:UPX_COMPRESS
"%UPX_PATH%" "%~dp0\Bin\SubtitleAPI\SubtitleAPI.dll" --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1
"%UPX_PATH%" "%~dp0\Bin\SubtitleWorkshop.exe" --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1

:END
PAUSE
