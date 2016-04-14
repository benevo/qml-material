echo off
echo Setting up environment for Qt usage...
set QT_INSTALL_DIR=D:\devel\IDE\Qt\dist\app\560.MG492
set QML_IMPORT_PATH=D:\devel\IDE\Qt\src\modules\qml
set PATH=%QT_INSTALL_DIR%\5.6\mingw49_32\bin;%QT_INSTALL_DIR%\Tools\mingw492_32\bin;%PATH%
cd /D %QT_INSTALL_DIR%\5.6\mingw49_32

echo Getting BAT run directory
cd /d %~dp0
set BAT_FILE_DIR=%cd%

if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("""%~fnx0"" h",0)(window.close)&&exit 
:begin

echo Starting the main.qml....
qmlscene -I %QML_IMPORT_PATH% %BAT_FILE_DIR%/main.qml
