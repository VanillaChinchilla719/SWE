@echo off
title [ real time viewer ]
color 0b
mode con: cols=80 lines=24
echo Welcome to the Observer script.
echo Change color by editing this script.
echo Recommended refresh rate = 6
set chat=C:\SWE\Database\Chatroom\Chatroom-log.txt
set /p lag="Refresh rate? (seconds): "

:Observer
cls
echo You are observing the chatroom.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
type %chat%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ping localhost -n %lag%>nul
goto Observer