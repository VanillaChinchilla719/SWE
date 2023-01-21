:: Profile template
@echo off
mode con: lines=30 cols=60
color 0e
Title [Example Profile]




:Main
echo                                                                                ..---..                                                   .'  _    `.                                             __..'  (o)    :                                            `..__          ;                                                 `.       /                                                    ;      `..---...___                                       .'                   `~-. .-')                             .                         ' _.'                            :                           :                               \                           '                                +                         J                                  `._                   _.'                                      `~--....___...---~'                                                                                 
echo ____________________________________________________________
echo.
echo                        Role: [User]
echo.
echo Username: Sampler
echo Age: N/A
echo Interests: Testing, Debugging, Pilates
echo Color: 0e
echo Image: 46
echo.
echo.
echo   (1) [Add Friend]  (2) [Message]  (3) [Block]  (4) [Exit]
echo.
echo ____________________________________________________________
choice /C:1234 /m "What would you like to do?"
	if %errorlevel%==1 (
		:: set /p befriend="Confirm the user's name: "
		:: echo "%befriend%">>"C:\SWE\Database\Friends\%usernamehere%.txt"
		goto Main
		)
	if %errorlevel%==2 (
		:: set /p befriend="Confirm the user's name: "
		:: set /p message="What would you like to say?: "
		:: echo "%DATE% %TIME% - %usernamehere%: %message%">>"C:\SWE\Database\Messages\%befriend%.txt"
		goto Main
		)
	if %errorlevel%==3 (
		:: set /p befriend="Please type the user's name: "
		:: echo "%befriend%">>"C:\SWE\Database\Blocked\%usernamehere%.txt"
		goto Main
		)
	if %errorlevel%==4 (
		exit
		)