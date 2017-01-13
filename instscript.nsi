; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "��������"
!define PRODUCT_FOLDER "${PRODUCT_NAME}"
!define PRODUCT_PROGRAM "FameSmsExcel.xla"
!define PRODUCT_VERSION "3.0.1"
!define PRODUCT_PUBLISHER "NURIGO"
!define PRODUCT_WEB_SITE "http://famesms.com"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\win-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\win-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "License.txt"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "FameSmsExcel.exe"
InstallDir "$PROGRAMFILES\Coolsms"
ShowInstDetails show
ShowUnInstDetails show

Section "�⺻���� (�ʼ�)" SEC01
  SectionIn RO
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  KillProcDLL::KillProc "EXCEL.EXE"
  Sleep 1000
  ExecWait '"$INSTDIR\xlunreg.exe" "$INSTDIR\${PRODUCT_PROGRAM}"'
  Delete "$INSTDIR\${PRODUCT_PROGRAM}"
  File "${PRODUCT_PROGRAM}"
  File "xlreg.exe"
  File "xlunreg.exe"
SectionEnd

#Section "Excel Add-in" SEC02
#  SetOutPath "$INSTDIR"
#  File "C:\Projects\CSExceller\${PRODUCT_PROGRAM}"
#SectionEnd
#
#Section "Office 2003" SEC03
#  SetOutPath "$PROGRAMFILES\Microsoft Office\OFFICE11\XLSTART"
#  File "C:\Projects\CSExceller\${PRODUCT_PROGRAM}"
#SectionEnd
#
#Section "Office 2007" SEC04
#  SetOutPath "$PROGRAMFILES\Microsoft Office\OFFICE12\XLSTART"
#  File "C:\Projects\CSExceller\${PRODUCT_PROGRAM}"
#SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateDirectory "$SMPROGRAMS\${PRODUCT_FOLDER}"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_FOLDER}\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\${PRODUCT_FOLDER}\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  ExecWait '"$INSTDIR\xlreg.exe" "$INSTDIR\${PRODUCT_PROGRAM}"'
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "�⺻������ ��ġ�մϴ�."
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)��(��) ������ ���ŵǾ����ϴ�."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)��(��) �����Ͻðڽ��ϱ�?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  KillProcDLL::KillProc "EXCEL.EXE"
  Sleep 1000
  ExecWait '"$INSTDIR\xlunreg.exe" "$INSTDIR\${PRODUCT_PROGRAM}"'
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$PROGRAMFILES\Microsoft Office\Office10\XLStart\${PRODUCT_PROGRAM}"
  Delete "$PROGRAMFILES\Microsoft Office\OFFICE12\XLSTART\${PRODUCT_PROGRAM}"
  Delete "$PROGRAMFILES\Microsoft Office\OFFICE11\XLSTART\${PRODUCT_PROGRAM}"
  Delete "$INSTDIR\xlreg.exe"
  Delete "$INSTDIR\xlunreg.exe"
  Delete "$INSTDIR\${PRODUCT_PROGRAM}"
  Delete "$SMPROGRAMS\${PRODUCT_FOLDER}\Uninstall.lnk"
  Delete "$SMPROGRAMS\${PRODUCT_FOLDER}\Website.lnk"
  RMDir "$SMPROGRAMS\${PRODUCT_FOLDER}"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd