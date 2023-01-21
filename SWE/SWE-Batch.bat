@echo off

title [ SWE Directory Selection ]
setlocal EnableDelayedExpansion
cls 
color
mode con: lines=8 cols=50
echo __________________________________________________
echo.
echo             Where is your SWE stored?
echo.
echo __________________________________________________
set /p sourceloc="Type here: "
pause

cls
title [ S W E   S t a r t   U p   S e q u e n c e ]
color 0d
mode con: cols=100 lines=10
set load=
set /a loadnum=0

:loading
set load=%load%\
cls
echo.
echo [ l o a d i n g   S W E . . . ]
echo ----------------------------------------------------------------------------------------------------
echo %load%
echo ----------------------------------------------------------------------------------------------------
ping localhost -n 1 >nul

set /a loadnum=%loadnum% +1
if %loadnum%==100 goto done

goto loading

:done
echo                                                                  [ l o a d i n g   c o m p l e t e ] 
echo                                          [ e n t e r ? ]
pause >nul
color 0b

goto Homepage

:Homepage
	cls
	mode con: cols=70 lines=30
	title [ S W E   H o m e   P a g e ]

	echo   .--.      .-'.      .--.      .--.      .--.      .--.      .`-.    
	echo :::::.\::::::::.\::::::::.\[ w e l c\o m e ]:.\::::::::.\::::::::.\:::
	echo '      `--'      `.-'      `--'      `--'      `--'      `-.'      `--
	echo.
	echo .    ,'    ,--'   ,'    `;-.     / \      `. o  ,--.      `.   /
	echo  `.-'    ,'      '`-.,  /       /   `.      `--'  o `.      \ /     `-
	echo    `.   /       /  '-..,       ;    ,-`.          ,---`.,.---'	
	echo      \ /     `-;.    ,'    ,--'   ,'    `;-.     / \      `. o  ,--.
	echo '`.---'          `.-'    ,'      '`-.,  /       /   `.      `--'  o `.
	echo    `. o  ,--.      `.   /       /  '-..,       ;    ,-`.          ,---
	echo      `--'  o `.      \ /     `-;.    ,'    ,--'   ,'    `;-.     / \
	echo .          ,---`'`.---'          `.-'    ,'      '`-.,  /       /   `.
	echo  `;-.     / \      `. o  ,--.      `.   /       /  '-..,       ;    ,-
	echo  /       /   `.      `--'  o `.      \ /     `-;.    ,'    ,--'   ,'
	echo ,       ;    ,-`.          ,---`.,.---'          `.-'    ,'      '`-.,
	echo     ,--'   ,'    `;-.     / \      `. o  ,--.      `.   /       /  '-.
	echo   ,'      '`-.,  /       /   `.      `--'  o `.      \ /     `-;.    ,
	echo.
	echo   .--.      .-'.      .--.      .--.      .--.      .--.      .`-.    
	echo :::::[\ s h e l l - b a s e d   w i n d o w s \ e x p l o r e r ].\:::
	echo '      `--'      `.-'      `--'      `--'      `--'      `-.'      `--
	echo.
	echo                 Do you already have an account?: (1/2)
	echo                           Customization: (3)
	echo                              Questions: (4)
	echo                                 Close: (5)
	echo.
	choice /c:12345 /m "Please choose an action:"
	
	if %errorlevel%==1 goto Log-in
	if %errorlevel%==2 goto Sign-up
	if %errorlevel%==3 call :Customize
	if %errorlevel%==4 goto Questions
	if %errorlevel%==5 goto Close

	goto Homepage

:Log-in
	cls 
	title [ S W E :  S i g n   I n   H e r e ]

	set /p usernamehere="Please enter your username:"
			echo.
			echo Checking database for "!usernamehere!".
			findstr /B !usernamehere! "%sourceloc%\SWE\Database\Users.txt" >nul
				if %errorlevel%==1 goto Homepage
				if %errorlevel%==0 (
					echo.
					echo Welcome !usernamehere!! Please Confirm Identity.
					echo.
				)
	set /p password="Please enter your password:"
			echo.
			echo Checking database for your password, !usernamehere!.
			findstr !usernamehere!-!password! "%sourceloc%\SWE\Database\Users.txt" >nul
				if %errorlevel%==1 goto Homepage
				if %errorlevel%==0 (
					echo.
					echo User: !usernamehere! Confirmed.
					echo.
					echo "[%DATE% %TIME% - !usernamehere! has logged in.]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
				)
	pause
	goto MainMenu
	
:Sign-up
	cls 
	title [ S W E :   C r e a t e   Y o u r   A c c o u n t ]
	setlocal

	echo    .-.-.   .-.-.   .-.-.   .-.-.   .-.-. 
	echo   / / \ \ / /[Sign up here!!] \ \ / / \ \
	echo  `-'   `-`-'   `-`-'   `-`-'   `-`-'   `-
	echo.
	echo "                    6&&7Q&&&&ggq,.       "
  echo "                dB'   `<&&&&&&&&&+,      "
  echo "  .             &'      'Q&&&&&&&&&&+.   "
  echo "  &&&g+-..    d&!        `&&&&&&&&&&&&o  "
  echo "  f&&&&&&&&gqd&&&    !q.   '&&Q&&&&%>'Q/ "
  echo "   Y&&&&&&&&&&&&&    `***' .-,';'`   'b  "
  echo "   `Q&&&&&&&&&&&P        ,d&&&bd&&['  &  "
  echo "    `Q&&&&&&&&*'         '&&&&&&&&&&bd&  "
  echo "     *&&&&&*'            `Q&&&&&&&&&&&l  "
  echo "      `Q&&?'               *Q&&&&&&&&&b  "
  echo "       &P'                  `t&&&&&&&&   "
  echo "       ]P                     `*Q&&&&    "
  echo "      ,&'                        `\&&    "
  echo "      |                            Q&    "
  echo "      !                            |P    "
  echo "       \                           |'    "
  echo "      ,.;>                         ;     "
  echo "     +--''`*>..                    /     "
  echo "      L--+'.;/*''+---....    ...-+<*':+. "
  echo "         '``           ''`''`+%--;/'''   "
  echo.
    
    set /p user0="Please choose a username: "
    		findstr /B !user0! "%sourceloc%\SWE\Database\Users.txt" >nul
    			if %errorlevel%==0 (
    			echo %user0% already exists! Please choose a different username.
    			pause
    			goto Sign-up
    			)
    		echo %user0%
    		Choice /c:YN /m "Is this you?"
    			if %errorlevel%==1 echo ("%user0%" is your Username.)
        	if %errorlevel%==2 goto Sign-up
        	goto Password-check

      :Password-check
        set /p pass="Please set a password: "
        set /p pass-check="Please type it again: "
        if "!pass!"=="!pass-check!" (
        	echo Your password has been set.
        	) else (
        	echo.
        	echo Passwords do not match!
        	echo.
        	goto Password-check
        	)
    	set add-user=%sourceloc%\SWE\Database\Users.txt
    		echo %user0%-%pass%>>"!add-user!"

    type nul > "%sourceloc%\SWE\Database\Friends\!user0!.txt"
    type nul > "%sourceloc%\SWE\Database\Messages\!user0!.txt"
    type nul > "%sourceloc%\SWE\Database\Blocked\!user0!.txt"
    type nul > "%sourceloc%\SWE\Database\Blocked-Messages\!user0!.txt"
    mkdir "%sourceloc%\SWE\Database\Messages\!user0!"
    echo Time to log in!
    echo "[%DATE% %TIME% - %user0% has created an account]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
    pause
    
    goto Homepage





:Customize
	title [ S W E :   Customize ]
	
	echo _________________________
	echo.
	echo          Options
	echo.
	echo (1) Change color scheme
	echo (2) Homepage
	echo.
	echo _________________________
	echo.
	choice /C:12 /m "Please choose an option: "
	if %errorlevel%==1 call :Change-Color
	if %errorlevel%==2 goto :Homepage
	exit /b 0

:Change-Color
	call :Display-Colors-Numbers
	set /P bg=Select background color: 
	set /P fg=Select foreground color: 
	set bg=%bg:~0,1%
	set fg=%fg:~0,1%
	color %bg%%fg%
	exit /b 0

:Display-Colors-Numbers
	for /l %%a in (0, 1, 7) do (
		color /? | findstr /C:"%%a = "
	)
	exit /b 0





:Questions
	title [ S W E :   Answers ]
	mode con: cols=42 lines=42
	cls
	echo             About This Batch
	echo.
	echo      This batch uses a user-password and
	echo time stamp for nonrepudity. Once logged
	echo in, the user is able to interact with
	echo this batch script's database through the
	echo provided menus. Logs, Inboxes, and Forum
	echo posts are all saved/viewed with text
	echo files and type commands. File sharing is
	echo done with copy commands, so specificity
	echo (in paths) is needed for file sharing.
	echo      The Homepage allows customization
	echo of the terminal's color scheme and makes
	echo setting up an account very simple. The
	echo variety in window sizes is due to a mode
	echo command and provides ample room for both
	echo aesthetics and user-friendliness. 
	echo      In the databases mentioned earlier
	echo the user can save albums and share files
	echo of any kind. (WAV, MP4, GIF, PDF, etc.)
	echo Users can even create profiles to be
	echo saved and viewed by other members of the
	echo shared file's server.
	echo      I just want to add that the ASCII
	echo text art is not originally made by me,
	echo and honestly I don't know who did make
	echo the art originally.
	echo      This script was designed to work on
	echo older versions of Windows as well. This
	echo adds compatibility and perhaps some vibes
	echo from DOS terminal days. Yeah the original
	echo file explorer is still used sometimes,
	echo but that just adds legacy compatibility.
	echo      This whole batch system will work
	echo without WiFi or WAN access. This must be
	echo saved in a USB drive attatched to a host
	echo router, switch, or share drive computer. 
	echo      Thank you for using this batch file!
	echo Enjoy your shared folders and forums with
	echo your friends, neighbors, and colleagues.
	echo.

	pause
	goto Homepage










:MainMenu
	cls
	mode con: lines=30 cols=65
	title [ S W E   M a i n   M e n u ]
	echo      .-.     .-.     .-.     .-.     .-.     .-.     .-.     .-.
  echo `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `
	echo.                                                               
	echo    .    _     *       \^|/   .       .      -*-              +   
  echo      .' \\`.     +    -*-     *   .         '       .   *       
 	echo   .  ^|__''_^|  .       /^|\ +         .    +       .           ^|  
  echo      ^|     ^| .                                        .     -*- 
  echo      ^|     ^|           `  .    '             . *   .    +    '  
  echo    _.'-----'-._     *                  .                        
	echo  /             \__.__.--._______________                        
	echo.                                                                   
	echo      .-.     .-.     .-.     .-.     .-.     .-.     .-.     .-.
  echo `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `._.'   `
  echo.
  echo [ w e l c o m e   b a c k   !usernamehere! ]
  echo.
  echo _.-._.-._.-._.-._.-._.-^|Chatroom      (1)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Pictures      (2)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Documents     (3)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Music         (4)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Videos        (5)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Forum/Q^&A     (6)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Messaging     (7)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Profiles      (8)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Moderator     (9)^|.-_.-._.-._.-._.-._.-._
  echo _.-._.-._.-._.-._.-._.-^|Sign out      (0)^|.-_.-._.-._.-._.-._.-._
  echo.
  echo.

  choice /C:1234567890 /m "What do you want to do?"
  	if %errorlevel%==1 goto PreChat
  	if %errorlevel%==2 goto Pictures
  	if %errorlevel%==3 goto Documents
  	if %errorlevel%==4 goto Music
  	if %errorlevel%==5 goto Videos
  	if %errorlevel%==6 goto Forum
  	if %errorlevel%==7 goto Inbox
  	if %errorlevel%==8 goto Profiles
  	if %errorlevel%==9 goto Moderator
  	if %errorlevel%==10 (
  		echo `[%DATE% %TIME% - %usernamehere% has logged out]`>>"%sourceloc%\SWE\Database\Track-Usage.txt"
  		goto Homepage
  		)










:PreChat
	echo `[%DATE% %TIME% - !usernamehere! has entered the chat.]`>>"%sourceloc%\SWE\Database\Chatroom\Chatroom-log.txt"
	start "" "%sourceloc%\SWE\Database\Chatroom\Chat-viewer.bat"
	goto Chatroom
:Chatroom
	cls 
	title [ S W E :   C h a t r o o m ]
	mode con: cols=81 lines=20
	set chat="%sourceloc%\SWE\Database\Chatroom\Chatroom-log.txt"
	echo Signed in as: !usernamehere!
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo.
	type !chat!
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo Optional commands: /exit /help 
	echo.
	set /p message="Type here:"
	echo.
	echo "[%DATE% %TIME% - !usernamehere!:]!message!">>"!chat!"
	if "!message!"=="/exit" (echo `[%DATE% %TIME% - !usernamehere! has left the chat.]`>>"!chat!" && goto MainMenu)
	if "!message!"=="/help" (echo `[There is a partner script for real time updates.]`>>"!chat!")
	goto Chatroom










:Pictures
	cls
	mode con: lines=40 cols=60
	title [ S W E   P i c t u r e s ]
	dir /b "%sourceloc%\SWE\Database\Images"
	echo ____________________________________________________________
	echo.
	echo View            (1)
	echo Add New         (2)
	echo Return to menu  (3)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:123 /m "Enter your choice here."
		if %errorlevel%==1 (
			set /p photos="Select a folder: "
			goto PhotoFolder
			)
		if %errorlevel%==2 (
			set /p newdir="Enter a name: "
			mkdir "%sourceloc%\SWE\Database\Images\!newdir!"
			echo `[%DATE% %TIME% - %usernamehere% added \Images\!newdir!]`>>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto Pictures
			)
		if %errorlevel%==3 (
			goto MainMenu
			)
	goto Pictures

:PhotoFolder
	cls
	mode con: lines=400 cols=60
	title [ S W E :   !photos! ]
	dir /b "%sourceloc%\SWE\Database\Images\!photos!"
	echo.
	echo ____________________________________________________________
	echo.
	echo View one             (1)
	echo View all             (2)
	echo Export               (3)
	echo Import               (4)
	echo Return to Pictures   (5)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:12345 /m "What would you like to do?"
		if %errorlevel%==1 (
			set /p view="Which photo?:"
			start "" explorer.exe "%sourceloc%\SWE\Database\Images\!photos!\!view!"
			goto PhotoFolder
			)
		if %errorlevel%==2 (
			start explorer.exe "%sourceloc%\SWE\Database\Images\!photos!"
			goto PhotoFolder
			)
		if %errorlevel%==3 (
			set /p copyphoto="Which photo?:"
			echo.
			echo Use the full path to save this file.
			set /p photolocation="Where specifically do you want it saved?:"
			copy "%sourceloc%\SWE\Database\Images\!photos!\!copyphoto!" "!photolocation!"
			echo "[%DATE% %TIME% - %usernamehere% copied Images\!photos!\!copyphoto!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto PhotoFolder
			)
		if %errorlevel%==4 (
			echo To dump all of one file type use *.filetype
			echo Use the full path to select a file or files.
			set /p from="What photo do you want to add?:"
			copy "!from!" "%sourceloc%\SWE\Database\Images\!photos!"
			echo "[%DATE% %TIME% - %usernamehere% has added !from! to \Images\!photos!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto PhotoFolder
			)

		if %errorlevel%==5 (
			goto Pictures
			)

	goto PhotoFolder










:Documents
	cls
	mode con: lines=100 cols=60
	title [ S W E   D o c u m e n t s ]
	dir /b "%sourceloc%\SWE\Database\Files"
	echo ____________________________________________________________
	echo.
	echo View Folder      (1)
	echo View Document    (2)
	echo Add New Folder   (3)
	echo Add New Document (4)
	echo Copy Document    (5)
	echo Return to menu   (6)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:123456 /m "Enter your choice here."
		if %errorlevel%==1 (
			set /p file="Which folder?: "
			goto DocumentFolder
			)
		if %errorlevel%==2 (
			set /p doc="Which document?: "
			start "" explorer.exe "%sourceloc%\SWE\Database\Files\!doc!"
			)
		if %errorlevel%==3 (
			set /p newdocfile="Enter a name: "
			mkdir "%sourceloc%\SWE\Database\Files\!newdocfile!"
			echo "[%DATE% %TIME% - %usernamehere% added \Files\!newdocfile!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==4 (
			echo.
			echo Use full path to select the correct document.
			set /p adddoc="Which document do you want to add?: "
			copy "!adddoc!" "%sourceloc%\SWE\Database\Files"
			echo "[%DATE% %TIME% - %usernamehere% added !adddoc! to Files]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==5 (
			set /p copydoc0="Which document?: "
			echo.
			echo Use full path to save this document.
			set /p doc0location="Where specifically do you want this saved?: "
			copy "%sourceloc%\SWE\Database\Files\!copydoc0!" "!doc0location!"
			echo "[%DATE% %TIME% - %usernamehere% copied \Files\!copydoc0!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==6 (
			goto MainMenu
			)
	goto Documents

:DocumentFolder
	cls 
	mode con: lines=400 cols=60
	title [ S W E :   !file! ]
	dir /b "%sourceloc%\SWE\Database\Files\!file!"
	echo ____________________________________________________________
	echo.
	echo View one             (1)
	echo View all             (2)
	echo Export               (3)
	echo Import               (4)
	echo Return to Documents  (5)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:12345 /m "What would you like to do?"
		if %errorlevel%==1 (
			set /p opendoc="Which document?: "
			start "" explorer.exe "%sourceloc%\SWE\Database\Files\!file!\!opendoc!"
			)
		if %errorlevel%==2 (
			start explorer.exe "%sourceloc%\SWE\Database\Files\!file!"
			)
		if %errorlevel%==3 (
			set /p copydoc="Which document?: "
			echo.
			echo Use full path to save this document.
			set /p doclocation="Where specifically do you want this saved?: "
			copy "%sourceloc%\SWE\Database\Files\!file!\!copydoc!" "!doclocation!"
			echo "[%DATE% %TIME% - %usernamehere% copied Files\!file!\!copydoc!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==4 (
			echo.
			echo Use full path to select the correct document.
			set /p importdoc="Which document?: "
			copy "!importdoc!" "%sourceloc%\SWE\Database\Files\!file!"
			echo "[%DATE% %TIME% - %usernamehere% added !importdoc! to Files\!file!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==5 (
			goto Documents
			)
	goto DocumentFolder










:Music
	cls
	mode con: lines=100 cols=60
	title [ S W E   M u s i c ]
	dir /b "%sourceloc%\SWE\Database\Songs"
	echo ____________________________________________________________
	echo.
	echo View artist      (1)
	echo Add artist       (2)
	echo Copy artist      (3)
	echo Return to menu   (4)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:1234 /m "Enter your choice here."
		if %errorlevel%==1 (
			set /p artist="Which artist?: "
			goto MusicArtist
			)
		if %errorlevel%==2 (
			echo.
			echo Use full path to add the correct folder.
			set /p addartist="Which artist?: "
			copy "!addartist!" "%sourceloc%\SWE\Database\Songs"
			echo "[%DATE% %TIME% - %usernamehere% added !addedartist! to Music]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==3 (
			set /p copyartist="Which artist?: "
			echo.
			echo Use full path to save this artist's music
			set /p copyartistpath="Where do you want this saved?: "
			copy "%sourceloc%\SWE\Database\Songs\!copyartist!" "!copyartistpath!"
			echo "[%DATE% %TIME% - %usernamehere% copied \Songs\!copyartist!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==4 (
			goto MainMenu
			)
	goto Music

:MusicArtist
	cls 
	mode con: lines=400 cols=60
	title [ S W E :   !artist! ]
	dir /b "%sourceloc%\SWE\Database\Songs\!artist!"
	echo ____________________________________________________________
	echo.
	echo View album       (1)
	echo Import album     (2)
	echo Export album     (3)
	echo Return to Music  (4)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:1234 /m "What would you like to do?"
		if %errorlevel%==1 (
			set /p album="Which album?: "
			goto MusicAlbum
			)
		if %errorlevel%==2 (
			echo.
			echo Use full path to add the correct folder.
			set /p addalbum="Which album?: "
			copy "!addalbum!" "%sourceloc%\SWE\Database\Songs\!artist!"
			echo "[%DATE% %TIME% - %usernamehere% added !addalbum! to !artist! ]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==3 (
			set /p copyalbum="Which album?: "
			echo.
			echo Use full path to save this album
			set /p copyalbumpath="Where do you want this saved?: "
			copy "%sourceloc%\SWE\Database\Songs\!artist!\!copyalbum!" "!copyalbumpath!"
			echo "[%DATE% %TIME% - %usernamehere% copied Songs\!artist!\!album!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==4 (
			goto Music
			)
	goto MusicArtist

:MusicAlbum
	cls 
	mode con: lines=400 cols=60
	title [ S W E :   %album% ]
	dir /b "%sourceloc%\SWE\Database\Songs\!artist!\!album!"
	echo ____________________________________________________________
	echo.
	echo View one         (1)
	echo View all         (2)
	echo Export           (3)
	echo Import           (4)
	echo Return to Artist (5)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:12345 /m "What would you like to do?"
		if %errorlevel%==1 (
			set /p song="Which song?: "
			start "" explorer.exe "%sourceloc%\SWE\Database\Songs\!artist!\!album!\!song!"
			)
		if %errorlevel%==2 (
			start explorer.exe "%sourceloc%\SWE\Database\Songs\!artist!\!album!"
			)
		if %errorlevel%==3 (
			set /p copysong="Which song?: "
			echo.
			echo Use full path to save this document.
			set /p songlocation="Where specifically do you want this saved?: "
			copy "%sourceloc%\SWE\Database\Songs\!artist!\!album!\!copysong!" "!songlocation!"
			echo "[%DATE% %TIME% - %usernamehere% copied Songs\!artist!\!song!\!copysong!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==4 (
			echo.
			echo Use full path to select the correct document.
			set /p importsong="Which song?: "
			copy "!importsong!" "%sourceloc%\SWE\Database\Songs\!artist!\!album!"
			echo "[%DATE% %TIME% - %usernamehere% added !importsong! to Songs\!artist!\!album!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			)
		if %errorlevel%==5 (
			goto MusicArtist
			)
	goto MusicAlbum










:Videos
	cls
	mode con: lines=30 cols=60
	title [ S W E   V i d e o s ]
	dir /b "%sourceloc%\SWE\Database\Vids"
	echo ____________________________________________________________
	echo.
	echo View            (1)
	echo Add New         (2)
	echo Return to menu  (3)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:123 /m "Enter your choice here."
		if %errorlevel%==1 (
			set /p videos="Select a folder: "
			goto VideoFolder
			)
		if %errorlevel%==2 (
			set /p newvids="Enter a name: "
			mkdir "%sourceloc%\SWE\Database\Vids\!newvids!"
			echo "[%DATE% %TIME% - %usernamehere% added Vids\!newvids!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto Videos
			)
		if %errorlevel%==3 (
			goto MainMenu
			)
	goto Videos

:VideoFolder
	cls
	mode con: lines=400 cols=60
	title [ S W E :   !videos! ]
	dir /b "%sourceloc%\SWE\Database\Vids\!videos!"
	echo ____________________________________________________________
	echo.
	echo View one             (1)
	echo View all             (2)
	echo Export               (3)
	echo Import               (4)
	echo Return to Videos     (5)
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:12345 /m "What would you like to do?"
		if %errorlevel%==1 (
			set /p viewvid="Which video?"
			start "" explorer.exe "%sourceloc%\SWE\Database\Vids\!videos!\!viewvid!"
			goto VideoFolder
			)
		if %errorlevel%==2 (
			start explorer.exe "%sourceloc%\SWE\Database\Vids\!videos!"
			goto VideoFolder
			)
		if %errorlevel%==3 (
			set /p copyvideo="Which video?: "
			echo.
			echo Use the full path to save this file.
			set /p videolocation="Where specifically do you want it saved?: "
			copy "%sourceloc%\SWE\Database\Vids\!videos!\!copyvideo!" "!videolocation!"
			echo "[%DATE% %TIME% - %usernamehere% copied \Vids\%videos%\%copyvideo%]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto VideoFolder
			)
		if %errorlevel%==4 (
			echo To dump all of one file type use *.filetype
			echo Use the full path to select a file or files.
			set /p vidfrom="What photo do you want to add?"
			copy "!vidfrom!" "%sourceloc%\SWE\Database\Vids\!videos!"
			echo "[%DATE% %TIME% - %usernamehere% added !vidfrom! to Vids\!videos!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			goto VideoFolder
			)

		if %errorlevel%==5 (
			goto Videos
			)
	goto VideoFolder










:Forum
	cls
	mode con: lines=400 cols=60
	title [ S W E   F o r u m s ]	
	dir /b "%sourceloc%\SWE\Database\QNA"
	echo ____________________________________________________________
	echo.
	echo View            (1)
	echo Reply           (2)
	echo Add New         (3)
	echo Return to menu  (4)
	echo.
	echo You do not need to add the .txt.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:1234 /m "Enter your choice here."
		if %errorlevel%==1 (
			set /p post="Select a post: "
			echo.
			type "%sourceloc%\SWE\Database\QNA\!post!.txt"
			echo.
			pause
			goto Forum
			)
		if %errorlevel%==2 (
			set /p replyto="Select post: "
			echo.
			type "%sourceloc%\SWE\Database\QNA\!replyto!.txt"
			echo.
			set /p response="What would you like to add?: "
			echo "[%DATE% %TIME% - %usernamehere%:] !response!">>"%sourceloc%\SWE\Database\QNA\!replyto!.txt"
			echo.
			echo Your reply has been posted.
			pause
			goto Forum
			)
		if %errorlevel%==3 (
			set /p newpost="Enter a post title: "
			set /p posthighlight="What do you want to say or ask?: "
			type nul > "%sourceloc%\SWE\Database\QNA\!newpost!.txt"
			echo "%DATE% %TIME% %usernamehere%: !posthighlight!">>"%sourceloc%\SWE\Database\QNA\!newpost!.txt"
			echo.
			echo Your post has been made.
			echo "[%DATE% %TIME% - %usernamehere% posted !newpost!]">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			pause
			goto Forum
			)
		if %errorlevel%==4 (
			goto MainMenu
			)
	goto Forum











:Inbox
	cls
	mode con: lines=30 cols=60
	title [ S W E   U s e r   I n b o x ]
	echo ____________________________________________________________
	echo.
	echo                 Welcome to your inbox menu.
	echo.
	echo   (1) View your friends list
	echo   (2) View your blocked list
	echo   (3) Unfriend someone
	echo   (4) Unblock someone
	echo   (5) View your messages
	echo   (6) Send a message
	echo   (7) Send a file
	echo   (8) Exit
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:12345678 /m "What would you like to do?: "
		if %errorlevel%==1 (
			mode con: lines=500 cols=60
			type "%sourceloc%\SWE\Database\Friends\%usernamehere%.txt"
			pause
			goto Inbox
			)
		if %errorlevel%==2 (
			mode con: lines=250 cols=60
			type "%sourceloc%\SWE\Database\Blocked\%usernamehere%.txt"
			pause
			goto Inbox
			)
		if %errorlevel%==3 (
			mode con: lines=500 cols=60
			type "%sourceloc%\SWE\Database\Friends\%usernamehere%.txt"
			set /p unfriend="Who would you like to unfriend?: "
			findstr /v "!unfriend!" "%sourceloc%\SWE\Database\Friends\%usernamehere%.txt" > "%sourceloc%\SWE\Database\Friends\%usernamehere%.txt"
			goto Inbox
			)
		if %errorlevel%==4 (
						mode con: lines=250 cols=60
			type "%sourceloc%\SWE\Database\Blocked\%usernamehere%.txt"
			set /p unblock="Who would you like to unblock?: 
			findstr /v "!unblock!" "%sourceloc%\SWE\Database\Blocked\%usernamehere%.txt" > "%sourceloc%\SWE\Database\Blocked\%usernamehere%.txt"
			goto Inbox
			)
		if %errorlevel%==5 (
			mode con: lines=1000 cols=60
			type "%sourceloc%\SWE\Database\Messages\%usernamehere%.txt"
			pause
			goto Inbox
			)
		if %errorlevel%==6 (
			mode con: lines=500 cols=60
			type "%sourceloc%\SWE\Database\Friends\%usernamehere%.txt"
			set /p msgrecip="Who are you messageing?: "
			set /p sendmsg="Type your message here: "
			findstr "%usernamehere%" "%sourceloc%\SWE\Database\Blocked\!msgrecip!.txt" > nul
				if %errorlevel%==0 (
					echo "%DATE% %TIME% - %usernamehere%: !sendmsg!">>"%sourceloc%\SWE\Database\Blocked-Messages\!msgrecip!.txt"
					goto Inbox
					)
			echo "[%DATE% %TIME% - %usernamehere%]: !sendmsg!">>"%sourceloc%\SWE\Database\Messages\!msgrecip!.txt"
			echo.
			echo Your message has been sent.
			pause
			goto Inbox
			)
		if %errorlevel%==7 (
			set /p filerecip="Who are you sending a file to?: "
			echo.
			set /p filesend="What is the file path?: "
			findstr "%usernamehere%" "%sourceloc%\SWE\Database\Blocked\!filerecip!.txt" > nul
				if %errorlevel%==0 (
					copy "!filesend!" "%sourceloc%\SWE\Database\Blocked-Messages\!filerecip!"
					goto Inbox
					)
			copy "!filesend!" "%sourceloc%\SWE\Database\Messages\!filerecip!"
			if %errorlevel%==1 (
				echo File not found!
				pause
				)
			goto Inbox
			)
		if %errorlevel%==8 (
			goto MainMenu
			)










:Profiles
	cls
	mode con: lines=30 cols=60
	title [ S W E   P r o f i l e s ]
	echo ____________________________________________________________
	echo.
	echo                Welcome to the profile menu.
	echo.
	echo   (1) View your profile
	echo   (2) Edit your profile
	echo   (3) View profile art
	echo   (4) View example
	echo   (5) View all profiles
	echo   (6) Exit
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	choice /C:123456 /m "What would you like to do?"
		if %errorlevel%==1 (
			start "" "%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat" %sourceloc% %usernamehere%
			goto Profiles
			)
		if %errorlevel%==2 goto MakeProfile
		if %errorlevel%==3 (
			cls
			mode con: lines=1000 cols=60
			type "%sourceloc%\SWE\Database\Art\ProfileArt-display.txt"
			pause
			goto Profiles
			)
		if %errorlevel%==4 (
			start "" "%sourceloc%\SWE\Database\Profiles\ProfileExample~~~.bat"
			goto Profiles
			)
		if %errorlevel%==5 goto ViewProfiles
		if %errorlevel%==6 goto MainMenu





:MakeProfile
	cls
	mode con: lines=30 cols=60
	title [ S W E :   Edit your Profile ]
	echo ____________________________________________________________
	echo.
	echo      You will be asked for the information
	echo          but you do not have to answer all of it.
	echo                 Blank answers are replaced with "N/A".
	echo.
	echo   Age
	echo   Interests
	echo   Profile color scheme (default will be 0a)
	echo   Profile art number (default will be 45)
	echo.
	echo ____________________________________________________________
	echo.
	set /p agevalue="What is your age?: "
		if !agevalue!=="" (
			set agevalue="N/A"
			echo Age set to N/A
			)
	echo.
	set /p interests="What are you in to?: "
		if !interests!=="" (
			set interests="N/A"
			echo Interests set to N/A
			)
	echo.
	for /l %%a in (0, 1, 7) do (
		color /? | findstr /C:"%%a = "
	)
	set /P profilebg=Select background color: 
		if !profilebg!=="" (
			set profilebg=0
			echo Bg set to 0
			)
	set /P profilefg=Select foreground color: 
		if !profilefg!=="" (
			set profilefg=a
			echo EG set to a
			)
	echo.
	echo Please use two digits. (Examples: 03 19 26 37 42)
	set /p artnum="What number of profile art do you want?: "
		if !artnum!=="" (
			set artnum=45
			echo Profile art set to 45
			)

	echo Age: !agevalue!
	echo Interests: !interests!
	echo Color: !profilebg!!profilefg!
	echo Image: !artnum!
	choice /C:YN /m "Are these parameters correct?"
		if %errorlevel%==2 goto MakeProfile
	type "%sourceloc%\SWE\Database\Art\ProfileArt-strings.txt" | find "!artnum!:" > "%sourceloc%\SWE\Database\Profiles\%usernamehere%.txt"
	type nul > "%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo @echo off>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
  echo color %profilebg%%profilefg%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo mode con: lines=30 cols=60>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo title [ %usernamehere%'s Profile ]>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo setlocal EnableDelayedExpansion>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo :Main>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo type "%%~1\SWE\Database\Profiles\%usernamehere%.txt">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo ____________________________________________________________>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo.>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo                        Role: [User]>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo.>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo Username: %usernamehere%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo Age: %agevalue%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo Interests: %interests%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo Color: %profilebg%%profilefg%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo Image: %artnum%>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo.>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo.>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo   (1) [Add Friend]  (2) [Message]  (3) [Block]  (4) [Exit]>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo.>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo echo ____________________________________________________________>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"

	echo choice /C:1234 /m "What would you like to do?">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"


	echo 			if %%errorlevel%%==1 (>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			set /p befriend="Confirm the user's name: ">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			echo "^!befriend^!"^>^>"%%~1\SWE\Database\Friends\%%~2.txt">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			goto Main>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			^)>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"


	echo 		if %%errorlevel%%==2 (>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			set /p profilemsg="Confirm the user's name: ">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			set /p newmessage="What would you like to say?: ">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			findstr "%%~2" "%%~1\SWE\Database\Blocked\^!profilemsg^!.txt" ^> nul>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo			if %%errorlevel%%==0 (>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
					echo "^!newmessage^!"^>"%%~1\SWE\Database\Blocked-Messages\%%DATE%% %%TIME%% - %%~2 to ^!profilemsg^!.txt">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 				goto main>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 				)>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			echo "[%%DATE%% %%TIME%% - %%~2]: ^!newmessage^!"^>^>"%%~1\SWE\Database\Messages\^!profilemsg^!.txt">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			goto Main>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			^)>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"


	echo 		if %%errorlevel%%==3 (>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			set /p blockuser="Please type the user's name: ">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			echo "^!blockuser^!"^>^>"%%~1\SWE\Database\Blocked\%%~2.txt">>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			goto Main>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			^)>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"


	echo 		if %%errorlevel%%==4 (>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			endlocal>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			exit>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	echo 			^)>>"%sourceloc%\SWE\Database\Profiles\%usernamehere%.bat"
	
	set load2=
	set /a loadnum2=0

	goto loading2

:loading2
	set load2=%load2%\\
	mode con: lines=5 cols=60
	cls
	echo.
	echo [ Generating profile . . . ]
	echo ------------------------------------------------------------
	echo %load2%
	echo ------------------------------------------------------------
	ping localhost -n 1 >nul

	set /a loadnum2=%loadnum2% +1
	if %loadnum2%==30 goto continue
	goto loading2

:continue
	pause
	echo "%DATE% %TIME% - %usernamehere% updated their profile!">>"%sourceloc%\SWE\Database\Track-Usage.txt"
	goto Profiles





:ViewProfiles
	cls
	mode con: lines=200 cols=60
	title [ SWE :   Viewing all profiles ]
	dir /b "%sourceloc%\SWE\Database\Profiles\*.bat"
	echo ____________________________________________________________
	echo.
	echo   (1) View a profile
	echo   (2) Exit
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	choice /C:123 /m "What would you like to do?: "
		if %errorlevel%==1 (
			echo.
			echo Do not type the .bat- only the username.
			echo.
			set /p viewprof="Which user's profile?: "
				start "" "%sourceloc%\SWE\Database\Profiles\!viewprof!.bat" %sourceloc% %usernamehere%
				pause
				goto ViewProfiles
			)
		if %errorlevel%==2 goto Profiles
		if %errorlevel%==3 (
			set /p modtabpass="?"
			if "!modtabpass!"=="ThreeInksModTab" (
				goto ModTab
				) else (
				goto ViewProfiles
				)
			)










:ModTab
	cls
	mode con: lines=30 cols=60
	Title [ S W E :   Moderator's Menu ]
	echo.
	echo ____________________________________________________________
	echo.
	echo                       Hello Moderator
	echo             .---------------------------------.           
	echo             ^|  .---------------------------.  ^|           
	echo             ^|[]^|                           ^|[]^|           
	echo             ^|  ^| (1) View Messages         ^|  ^|           
	echo             ^|  ^| (2) View Files            ^|  ^|           
	echo             ^|  ^| (3) Art Submitions        ^|  ^|           
	echo             ^|  ^| (4) View Reviews          ^|  ^|           
	echo             ^|  ^| (5) View Bug Reports      ^|  ^|           
	echo             ^|  ^| (6) View Usage Report     ^|  ^|           
	echo             ^|  ^| (7) Go to Main Menu       ^|  ^|           
	echo             ^|  ^|                           ^|  ^|           
	echo             ^|  `---------------------------'  ^|           
	echo             ^|      __________________ _____   ^|           
	echo             ^|     ^|   ___            ^|     ^|  ^|           
	echo             ^|     ^|  ^|   ^|           ^|     ^|  ^|           
	echo             ^|     ^|  ^|   ^|           ^|     ^|  ^|           
	echo             ^|     ^|  ^|   ^|           ^|     ^|  ^|           
	echo             ^|     ^|  ^|___^|           ^|     ^|  ^|           
	echo             \_____^|__________________^|_____^|__^|
	echo         (8) Create a save state and clear directories.
	echo.
	echo ____________________________________________________________
	echo.
	
	choice /C:12345678 /m "What would you like to do?"
		if %errorlevel%==1 (
			start "" "%sourceloc%\SWE\Database\Moderator.txt
			goto ModTab
			)
		if %errorlevel%==2 (
			start "" "%sourceloc%\SWE\Database\Moderator
			goto ModTab
			)
		if %errorlevel%==3 (
			start "" "%sourceloc%\SWE\Database\Art"
			goto ModTab
			)
		if %errorlevel%==4 (
			start "" "%sourceloc%\SWE\Database\Reviews.txt"
			goto ModTab
			)
		if %errorlevel%==5 (
			start "" "%sourceloc%\SWE\Database\BugReport.txt"
			goto ModTab
			)
		if %errorlevel%==6 (
			start "" "%sourceloc%\SWE\Database\Track-Usage.txt"
			goto ModTab
			)
		if %errorlevel%==7 goto MainMenu

		if %errorlevel%==8 (
			echo.
			echo This won't delete Users, Friend/Blocked lists, and Profiles.
			echo This will not create a back up if not ran as Administrator.
			echo Close SWE now to cancel.
			echo.
			pause

			set datadump="Data-prior-to-%DATE%"
			mkdir "%sourceloc%\SWE\!datadump!"
			xcopy /e /q /h "%sourceloc%\SWE\Database" "%sourceloc%\SWE\!datadump!"
			timeout /t 5
			del "%sourceloc%\SWE\Database\BugReport.txt"
			del "%sourceloc%\SWE\Database\Moderator.txt"
			del "%sourceloc%\SWE\Database\Reviews.txt"
			del "%sourceloc%\SWE\Database\Track-Usage.txt"
			del "%sourceloc%\SWE\Database\Chatroom\Chatroom-log.txt"
			type nul >"%sourceloc%\SWE\Database\BugReport.txt"
			type nul >"%sourceloc%\SWE\Database\Moderator.txt"
			type nul >"%sourceloc%\SWE\Database\Reviews.txt"
			type nul >"%sourceloc%\SWE\Database\Track-Usage.txt"
			type nul >"%sourceloc%\SWE\Database\Chatroom\Chatroom-log.txt"
			for %%b in (%sourceloc%\SWE\Database\Files) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\Images) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\Songs) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\Vids) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\QNA) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\Messages) do (del /q %%b)
			for %%b in (%sourceloc%\SWE\Database\Moderator) do (del /q %%b)
			echo "%DATE% %TIME% - %usernamehere% reset the database.">>"%sourceloc%\SWE\Database\Track-Usage.txt"
			copy "%sourceloc%\SWE\!datadump!\Database\Moderator\ws-commands.pdf" "%sourceloc%\SWE\Database\Moderator"
			goto Resetting
		)

:Resetting
	set process=
	set /a process=0

	goto Resetting2

:Resetting2
	set process=%process%\\
	mode con: lines=5 cols=60
	cls
	echo.
	echo [ Resetting Database . . . ]
	echo ------------------------------------------------------------
	echo %process%
	echo ------------------------------------------------------------
	ping localhost -n 1 >nul

	set /a processnum=%processnum% +1
	if %processnum%==30 goto PostReset
	goto Resetting2

:PostReset
	cls
	echo.
	echo [ Reset complete ]
	echo.
	choice /C:12 /m "[ Return to Moderator's Menu or Homepage? ]"
	if %errorlevel%==1 goto ModTab
	if %errorlevel%==2 goto Homepage










:Moderator
	mode con: lines=30 cols=60
	Title [ S W E :   Moderator Submition Page ]
	cls
	echo ____________________________________________________________
	echo.
	echo                                        __,---.__
	echo                                     ,-'         `-.
	echo    Welcome.                       ,'               `.
	echo                                  /                   \
	echo      This page allows any       /         .           \
	echo    user the ability to talk    ;           )           :
	echo    to or communicate with      ^|          ((           ^|
	echo    the designated mods of      ^|          ) \          ^|
	echo    this server's SWE. Any      :         ( , )         ;
	echo    concerns, comments, or       \       _ `^|'__       /
	echo    suggestions can be sent       \     ( """"_ )     /
	echo    through this page.             `.    )/(/( \^|   ,'
	echo                                     `- ()  )()^|^| -'
	echo                                         ^| ()  ^|^|
	echo    (1) Anonymously Message              ^|     ^|^|
	echo    (2)     Send a File                  ^|     ()
	echo    (3) ASCII Art Submition              ^|     ^|
	echo    (4)        Review                    ^|     ^|
	echo    (5)      Bug Report                  ^|     ^|
	echo    (6)         Exit                     ^|     ^|
	echo                                     ____^|_____^|____
	echo                                    (________    ___)
	echo       Arrow keys available.           \__  _____/
	echo                                       (_________)
	echo.
	echo ____________________________________________________________
	echo.
	
	choice /C:123456 /m "What would you like to do?"
		if %errorlevel%==1 (
			goto SendMessage
			)
		if %errorlevel%==2 (
			goto SendFile
			)
		if %errorlevel%==3 (
			goto SendArt
			)
		if %errorlevel%==4 (
			goto Review
			)
		if %errorlevel%==5 (
			goto BugReport
			)
		if %errorlevel%==6 (
			goto MainMenu
			)

:SendMessage
	mode con: lines=30 cols=60
	Title [ Moderator Submition Page : Message ]
	cls
	echo ____________________________________________________________
	echo.
	echo    Identification is optional, but required
	echo      for replies, connotation, and follow-ups. 
	echo.
	echo Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	set /p msg="Type your message here: "
		echo "%DATE% %TIME% - !msg!">>"%sourceloc%\SWE\Database\Moderator.txt"
	echo.
	echo Your message has been sent.
	echo.
	echo                 Returning to Moderator menu.
	echo.
	pause
	goto Moderator

:SendFile
	mode con: lines=30 cols=60
	Title [ Moderator Submition Page : File ]
	cls
	echo ____________________________________________________________
	echo.
	echo    Appropriately name your file
	echo       if used for situation reporting.
	echo          Use the whole location path in order to
	echo              select the appropriate file for submition.
	echo.
	echo    Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	set /p fileloc="Enter the full file path: "
		copy "!fileloc!" "%sourceloc%\SWE\Database\Moderator"
	echo.
	echo Your file has been submitted.
	echo.
	echo                 Returning to Moderator menu.
	echo.
	pause
	goto Moderator

:SendArt
	mode con: lines=30 cols=60
	Title [ Moderator Submition Page : ASCII Art ]
	cls
	echo ____________________________________________________________
	echo.
	echo    Here, you can submit ASCII text art.
	echo          Use the whole location in order to
	echo              select the appropriate file for submition.
	echo.
	echo    Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	set /p artloc="Enter the full file path: "
		copy "!artloc!" "%sourceloc%\SWE\Database\Moderator"
	echo.
	echo Your art has been submitted.
	echo.
	echo                 Returning to Moderator menu.
	echo.
	pause
	goto Moderator

:Review
	mode con: lines=30 cols=60
	Title [ Moderator Submition Page : Review ]
	cls
	echo ____________________________________________________________
	echo.
	echo    Identification is optional, but any sort
	echo      of feedback or compliments are appreciated. 
	echo.
	echo    Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	set /p review="Type your message here: "
		echo "%DATE% %TIME% - !review!">>"%sourceloc%\SWE\Database\Reviews.txt"
	echo.
	echo Your message has been sent.
	echo.
	echo                 Returning to Moderator menu.
	echo.
	pause
	goto Moderator	

:BugReport
	mode con: lines=30 cols=60
	Title [ Moderator Submition Page : Bug Report ]
	cls
	echo ____________________________________________________________
	echo.
	echo    Identification is optional.
	echo       Thank you for reporting a bug. Any details
	echo          should be helpful in fixing this script for
	echo             further usage and any future batch developments.
	echo.
	echo   Arrow keys are functional to recall past entries.
	echo.
	echo ____________________________________________________________
	echo.
	set /p bugnotice="Describe the bug encountered: "
		echo "%DATE% %TIME% - !bugnotice!">>"%sourceloc%\SWE\Database\BugReport.txt"
	echo.
	echo Your message has been sent.
	echo.
	echo                 Returning to Moderator menu.
	echo.
	pause
	goto Moderator








:Close
cls
	echo Are you sure?.
	choice /c:YN /m "Confirm."
		if %errorlevel%==1 (
			endlocal
			exit
		)
		if %errorlevel%==2 (
			goto Homepage
		)