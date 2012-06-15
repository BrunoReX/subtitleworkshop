;-------------------------------------------------------------;
;               URUSoft Subtitle Workshop 2.52                ;
;                   Installer Script File                     ;
;-------------------------------------------------------------;

; Program information
!define PRODUCT "Subtitle Workshop"
!define PRODUCT_SHORTNAME "SubtitleWorkshop"
!define PRODUCT_EXENAME "subtitleworkshop.exe"
!define VER_MAJOR 2
!define VER_MINOR 52
!define VERSION "${VER_MAJOR}.${VER_MINOR}"
!define WEBSITE "http://sw.binhoster.com"
Name "${PRODUCT}"

; Various settings
SetCompressor /SOLID lzma
BrandingText "Subtitle Workshop ${VER_MAJOR}.${VER_MINOR}"
SetOverwrite on
!include "${NSISDIR}\Contrib\Modern UI\System.nsh"
!define LOGICLIB_SECTIONCMP
!include "LogicLib.nsh"
!include "Sections.nsh"

!define MUI_ABORTWARNING
!define MUI_UNINSTALLER
!define MUI_UNCONFIRMPAGE

; Cosmetic settings
!define MUI_UI "Res\usmodern.exe"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Res\usmodern-header2+Bdzl.bmp"
!define MUI_HEADERIMAGE_RIGHT
Icon "Res\my-install.ico"
UninstallIcon "Res\my-uninstall.ico"

; Path to files & installer output
!define FILESPATH "c:\Backa\Projects\Subtitle_Workshop_252_releases\${VER_MAJOR}.${VER_MINOR}"
!define LICENSEPATH "c:\Backa\Projects\Subtitle_Workshop_252_releases\${VER_MAJOR}.${VER_MINOR}"
OutFile "${PRODUCT_SHORTNAME}${VER_MAJOR}${VER_MINOR}.exe"

!define MUI_FINISHPAGE_LINK "http://sw.binhoster.com"
!define MUI_FINISHPAGE_LINK_LOCATION ${WEBSITE}

; Path to EXE, to display in the finish page after successful instalation
!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_EXENAME}"

; Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE $(urusoftlicense)
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Installer language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Russian"

; License file
LicenseLangString urusoftlicense ${LANG_ENGLISH} "${LICENSEPATH}\License_gpl-3.0_ENG.txt"
LicenseLangString urusoftlicense ${LANG_RUSSIAN} "${LICENSEPATH}\License_gpl-3.0_RUS.txt"

; Language strings for component-selection page - Titles
LangString TITLE_MainFiles ${LANG_ENGLISH} "Main files"
LangString TITLE_MainFiles ${LANG_RUSSIAN} "Основные файлы"
LangString TITLE_Manual ${LANG_ENGLISH} "Manual"
LangString TITLE_Manual ${LANG_RUSSIAN} "Руководство пользователя"
LangString TITLE_CustomFormats ${LANG_ENGLISH} "Custom formats"
LangString TITLE_CustomFormats ${LANG_RUSSIAN} "Пользовательские форматы"
LangString TITLE_LangFiles ${LANG_ENGLISH} "Language files"
LangString TITLE_LangFiles ${LANG_RUSSIAN} "Файлы языков"
LangString TITLE_ShortCuts ${LANG_ENGLISH} "Shortcuts"
LangString TITLE_ShortCuts ${LANG_RUSSIAN} "Ярлыки"
LangString TITLE_StartMenuShortCuts ${LANG_ENGLISH} "Start menu"
LangString TITLE_StartMenuShortCuts ${LANG_RUSSIAN} "Меню пуск"
LangString TITLE_DesktopShortCuts ${LANG_ENGLISH} "Desktop"
LangString TITLE_DesktopShortCuts ${LANG_RUSSIAN} "Рабочий стол"
LangString TITLE_QuickLaunchShortCuts ${LANG_ENGLISH} "Quick launch"
LangString TITLE_QuickLaunchShortCuts ${LANG_RUSSIAN} "Быстрый запуск"

; Language strings for component-selection page - Descriptions
LangString DESC_MainFiles ${LANG_ENGLISH} "Copy the ${PRODUCT}'s main files into the desired folder."
LangString DESC_MainFiles ${LANG_RUSSIAN} "Копировать основные файлы ${PRODUCT} в выбранную папку."
LangString DESC_Manual ${LANG_ENGLISH} "Installs the manual in all available translations."
LangString DESC_Manual ${LANG_RUSSIAN} "Установить руководство пользователя на всех доступных языках."
LangString DESC_CustomFormats ${LANG_ENGLISH} "Copies the custom format examples."
LangString DESC_CustomFormats ${LANG_RUSSIAN} "Копирование примеров пользовательских форматов файлов."
LangString DESC_LangFiles ${LANG_ENGLISH} "Installs the additional language files pack."
LangString DESC_LangFiles ${LANG_RUSSIAN} "Установка дополнительных файлов языков."
LangString DESC_ShortCuts ${LANG_ENGLISH} "Creates additional shortcuts."
LangString DESC_ShortCuts ${LANG_RUSSIAN} "Создание дополнительных ярлыков."
LangString DESC_StartMenuShortCuts ${LANG_ENGLISH} "Creates shortcuts in the start menu."
LangString DESC_StartMenuShortCuts ${LANG_RUSSIAN} "Создание ярлыков в меню пуск."
LangString DESC_DesktopShortCuts ${LANG_ENGLISH} "Creates shortcuts in the desktop."
LangString DESC_DesktopShortCuts ${LANG_RUSSIAN} "Создание ярлыков на рабочем столе."
LangString DESC_QuickLaunchShortCuts ${LANG_ENGLISH} "Creates shortcuts in the quick launch."
LangString DESC_QuickLaunchShortCuts ${LANG_RUSSIAN} "Создание ярлыков в меню быстрого запуска."

; Translations of the manual
LangString TITLE_ManualEnglish ${LANG_ENGLISH} "English"
LangString TITLE_ManualRussian ${LANG_ENGLISH} "Russian"

LangString TITLE_ManualEnglish ${LANG_RUSSIAN} "Английский"
LangString TITLE_ManualRussian ${LANG_RUSSIAN} "Русский"

; Folder-selection page
InstallDir "$PROGRAMFILES\URUSoft\${PRODUCT}"

; -------------------------------- ;
;         Files to install         ;
; -------------------------------- ;

Section $(TITLE_MainFiles) MainFiles
  SectionIn RO

  SetOutPath $INSTDIR
    File "${FILESPATH}\${PRODUCT_EXENAME}"
    File "${FILESPATH}\shortcuts.key"
  SetOutPath $INSTDIR\SubtitleAPI
    File "${FILESPATH}\SubtitleAPI\SubtitleAPI.dll"
  SetOutPath $INSTDIR\OCRScripts
    File "${FILESPATH}\OCRScripts\*.ocr"
  SetOutPath $INSTDIR\PascalScripts
    File "${FILESPATH}\PascalScripts\*.pas"
  CreateDirectory $INSTDIR\CustomFormats

  WriteRegStr HKLM "SOFTWARE\URUSoft\${PRODUCT}" "Install_Dir" "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}" "DisplayName" "${PRODUCT} ${VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteUninstaller "uninstall.exe"

SectionEnd

;--------------------------------------------------------------------

SubSection $(TITLE_Manual) Manual

  Section $(TITLE_ManualEnglish) ManualEnglish
    SetOutPath $INSTDIR\Help
    File "${FILESPATH}\Help\Manual.html"
  SectionEnd

  Section $(TITLE_ManualRussian) ManualRussian
    SetOutPath $INSTDIR\Help
    File "${FILESPATH}\Help\ManualRUS.html"
  SectionEnd

SubSectionEnd

;--------------------------------------------------------------------

Section $(TITLE_CustomFormats) CustomFormats
  SetOutPath "$INSTDIR\Custom Formats Examples"
    File "${FILESPATH}\Custom Formats Examples\*.*"
SectionEnd

;--------------------------------------------------------------------

Section $(TITLE_LangFiles) LangFiles
  SetOutPath $INSTDIR\Langs
    File "${FILESPATH}\Langs\*.lng"
    File "${FILESPATH}\Langs\Charsets.txt"
SectionEnd

;--------------------------------------------------------------------

SubSection $(TITLE_ShortCuts) ShortCuts

  Section $(TITLE_StartMenuShortCuts) StartMenuShortCuts
    CreateDirectory "$SMPROGRAMS\URUSoft\${PRODUCT}"

    CreateDirectory "$SMPROGRAMS\URUSoft\${PRODUCT}\Help"

    ${If} ${SectionIsSelected} ${ManualEnglish}
        CreateShortCut "$SMPROGRAMS\URUSoft\${PRODUCT}\Help\Manual (English).lnk" "$INSTDIR\Help\Manual.html" "" "$INSTDIR\Help\Manual.html" 0
    ${EndIf}
    ${If} ${SectionIsSelected} ${ManualRussian}
      CreateShortCut "$SMPROGRAMS\URUSoft\${PRODUCT}\Help\Manual (Russian).lnk" "$INSTDIR\Help\ManualRUS.html" "" "$INSTDIR\Help\ManualRUS.html" 0
    ${EndIf}

    CreateShortCut "$SMPROGRAMS\URUSoft\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
    CreateShortCut "$SMPROGRAMS\URUSoft\${PRODUCT}\Uninstall ${PRODUCT}.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  SectionEnd

  Section $(TITLE_DesktopShortCuts) DesktopShortCuts
    CreateShortCut "$DESKTOP\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
  SectionEnd

  Section $(TITLE_QuickLaunchShortCuts) QuickLaunchShortCuts
    CreateShortCut "$QUICKLAUNCH\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT_EXENAME}" "" "$INSTDIR\${PRODUCT_EXENAME}" 0
  SectionEnd

SubSectionEnd

;--------------------------------------------------------------------

; When installer is launched...

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; Descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${MainFiles} $(DESC_MainFiles)
  !insertmacro MUI_DESCRIPTION_TEXT ${Manual} $(DESC_Manual)
  !insertmacro MUI_DESCRIPTION_TEXT ${CustomFormats} $(DESC_CustomFormats)
  !insertmacro MUI_DESCRIPTION_TEXT ${LangFiles} $(DESC_LangFiles)
  !insertmacro MUI_DESCRIPTION_TEXT ${ShortCuts} $(DESC_ShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${StartMenuShortCuts} $(DESC_StartMenuShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${DesktopShortCuts} $(DESC_DesktopShortCuts)
  !insertmacro MUI_DESCRIPTION_TEXT ${QuickLaunchShortCuts} $(DESC_QuickLaunchShortCuts)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; -------------------------------- ;
;        Uninstaller section       ;
; -------------------------------- ;

Section "Uninstall"

  ; remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_SHORTNAME}"
  DeleteRegKey HKLM "Software\URUSoft\${PRODUCT}"

  Delete "$INSTDIR\*.*"
  Delete "$INSTDIR\OCRScripts\*.*"
  RMDir  "$INSTDIR\OCRScripts"
  Delete "$INSTDIR\PascalScripts\*.*"
  RMDir  "$INSTDIR\PascalScripts"
  Delete "$INSTDIR\SubtitleAPI\*.*"
  RMDir  "$INSTDIR\SubtitleAPI"
  Delete "$INSTDIR\Langs\*.*"
  Delete "$INSTDIR\Custom Formats Examples\*.*"
  RMDir  "$INSTDIR\Custom Formats Examples\"
  Delete "$INSTDIR\CustomFormats\*.*"
  RMDir  "$INSTDIR\CustomFormats\"
  RMDir  "$INSTDIR\Langs\"
  Delete "$INSTDIR\Help\*.*"
  RMDir  "$INSTDIR\Help\"
  Delete "$SMPROGRAMS\URUSoft\${PRODUCT}\*.*"
  Delete "$SMPROGRAMS\URUSoft\${PRODUCT}\Help\*.*"
  RMDir  "$SMPROGRAMS\URUSoft\${PRODUCT}\Help"
  RMDir  "$SMPROGRAMS\URUSoft\${PRODUCT}"
  Delete "$DESKTOP\${PRODUCT}.lnk"
  Delete "$QUICKLAUNCH\${PRODUCT}.lnk"
  RMDir  "$INSTDIR"
  RMDir  "$SMPROGRAMS\URUSoft\"

SectionEnd

; When uninstaller is launched...
Function un.onInit
  ; Get language from registry
  ReadRegStr $LANGUAGE HKCU "Software\URUSoft\${PRODUCT}" "Installer Language"
FunctionEnd
