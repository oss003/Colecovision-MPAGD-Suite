@echo off
set NAME=baldy
rem "str=The quick brown fox"
for /f "usebackq delims=" %%I in (`powershell "\"%NAME%\".toUpper()"`) do set "NAME=%%~I"
echo %NAME%
