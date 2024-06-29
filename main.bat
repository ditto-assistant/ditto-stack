@echo off

REM copy .env into assistant/ and nlp_server/
copy .env assistant
copy .env nlp_server

REM Start the first process
start "" assistant.bat

REM Start the second process
start "" nlp_server.bat

REM Start the third process
start "" vision_server.bat

REM Start the fourth process
start "" gui.bat    

REM keep running
pause
