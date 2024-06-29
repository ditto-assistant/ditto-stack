@echo off

REM Start the first process
start "" assistant.bat

REM Start the second process
start "" nlp_server.bat

REM Start the third process
start "" vision_server.bat

REM keep running
pause
