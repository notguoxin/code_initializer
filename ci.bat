@echo off
    IF "%1" == "" echo Error: {%1}  is not a valid function && exit /b
    IF "%1" == "-i" goto init_script
    IF "%1" == "-u" goto delete_script
    IF "%1" == "-r" goto run_script
    IF "%1" == "-h" goto help
    IF "%1" == "-/help" goto help
    echo Error: {%1}  is not a valid function 
exit /b

:delete_script
    IF "%2" == "-q" set "folderpath=%3"
    IF "%3" == "" set "folderpath=%2"
    IF NOT EXIST "%folderpath%" echo Error: Folder does not exists && exit /B
    IF "%2" == "-q" rmdir /s /q %folderpath% && exit /b
    set /p continue="Do you want to delete %folderpath%?(yes/no) "
    IF "%continue%" == "yes" rmdir /s /q %folderpath%
	IF ERRORLEVEL 1 echo ERROR: failed to run command at line 17 && exit /b /errorcode 1
exit /b

:run_script
    IF "%2" == "file_manager" (
        node "D:\code-lib\file_manager\app.js"
		IF ERRORLEVEL 1 echo ERROR: failed to run command at line 23 && exit /b /errorcode 1
    )
exit /b
:init_script
    IF "%2" == "" echo Error: script type is invalid && exit /b
    IF "%4" == "" echo Error: folder name is invalid && exit /b
    IF EXIST "%3" echo Error: Folder exists && exit /B
    set "scripttype=%2"
    set "folderpath=%3"
    set "projectname=%4"
    IF "%scripttype%" == "javascript" goto js
exit /B
:js
    mkdir %folderpath%
	IF ERRORLEVEL 1 echo ERROR: failed to run command at line 35 && exit /b /errorcode 1
    cd %folderpath%
	IF ERRORLEVEL 1 echo ERROR: failed to run command at line 37 && exit /b /errorcode 1
    :: Generate package.json
    echo { > package.json && echo   "name": "%projectname%",>> package.json && echo   "version": "1.0.0",>> package.json && echo   "description": "%projectname%",>> package.json && echo   "main": "app.js",>> package.json && echo   "scripts": {>> package.json && echo     "test": "echo \"Error: no test specIFied\" && exit 1">> package.json && echo   },>> package.json && echo   "author": "ChanGuoXin",>> package.json && echo "GuoXin Project Template Generator(GPTG)":"1.0.5", >> package.json && echo   "license": "ISC">> package.json && echo }>> package.json
    ::generate main file
    echo //an application >app.js && echo const config = require("\x44\x3a\x5c\x63\x6f\x64\x65\x2d\x6c\x69\x62\x5c\x5f\x5f\x6d\x61\x69\x6e\x5f\x5f\x5c\x63\x6f\x6e\x66\x69\x67\x2e\x6a\x73") >> app.js && echo const easy_config =require("D:\\code-lib\\__main__\\easy_config.js"); >> app.js
    ::open explorer
    set /p open_explorer="open explorer?(yes/no) "
    IF "%open_explorer%" =="yes" start .
	IF ERRORLEVEL 1 echo ERROR: failed to run command at line 58 && exit /b /errorcode 1
    ::go home
    cd /d D:\code-lib\code_initializer
exit /B