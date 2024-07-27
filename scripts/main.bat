@echo off

REM copy .env into assistant/ and nlp_server/
copy .env assistant
copy .env nlp_server

REM if users.json exists, copy it into nlp_server/, else create it by copying example.users.json into nlp_server/ as users.json
if exist users.json (
    copy users.json nlp_server
) else (
    copy example.users.json nlp_server\users.json
)

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
