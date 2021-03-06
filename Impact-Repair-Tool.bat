@echo OFF

::===startup===
:startup
set dir=%userprofile%\Appdata\Roaming\.minecraft
goto homemenu

::===homemenu===
:homemenu
title Impact Repair Tool
cls
echo Welcome to Impact Repair Tool created by Zezypisa, Make sure Minecraft is closed when using this.
echo This file alone only works for windows and default MC launcher
echo 
echo ===Select Repair Option===
echo 1) Uninstall Impact
echo 2) Uninstall Baritone
echo 3) Remove config for Impact
echo 4) Remove config for Baritone
echo 5) Tlauncher / 3rd party launcher fix
echo type "EXIT" to exit
set /p select=Please Type an Option: 
if "%select%" == "1" goto uninstallimpact
if "%select%" == "2" goto uninstallbaritone
if "%select%" == "3" goto rcimpact
if "%select%" == "4" goto rcbaritone
if "%select%" == "5" goto tlauncher
if "%select%" == "exit" goto menuexit
echo %select% is not a choice, please type a number
pause
goto homemenu

::===uninstallimpact===
:uninstallimpact
cls
echo This will remove impact, and will remove the config too, are you sure you want to continue?
echo please type "yes" or "no"
set /p select=Please type an option: 
if "%select%" == "yes" goto uiallow
if "%select%" == "no" goto uideny
echo %select% is not a choice, please type yes or no
pause
goto uninstallimpact

	:uiallow
	cls
	echo Please type out the version to use
	echo type "EXIT" to exit
	set /p chooseVer=Please type a version, forge, nightly, other:  
	if %chooseVer%==1.11.2 (
		set delver="1.11.2-Impact_4.0"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.12 (
		set delver="1.12-Impact_4.0"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.12.1 (
		set delver="1.12.1-Impact_4.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.12.2 (
		set delver="1.12.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.13.2 (
		set delver="1.13.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.14.4 (
		set delver="1.14.4-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.15.2 (
		set delver="1.15.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%==1.16.4 (
		set delver="1.16.4-Impact_nightly-20210115"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%==1.16.5 (
		set delver="1.16.4-Impact_nightly-20210303"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%==forge (
		set delver="none"
		set whattype="forge"
		goto uiallow2
	)
	if %chooseVer%==nightly (
		set delver="none"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%==other (
		set delver="none"
		set whattype="other"
		goto uiallow2
	)
	if %chooseVer%==exit (
		goto homemenu
	)
	echo %chooseVer% is not a choice, please type a version
	pause
	goto uiallow
	
		:uiallow2
		//delete files in dir
		del /S /Q %dir%\Impact\
		del /S /Q %dir%\Baritone\
		del /S /Q %dir%\libraries\cabaletta
		del /S /Q %dir%\libraries\com\github\ImpactDevelopment
		del /S /Q %dir%\libraries\com\github\ZeroMemes\Alpine
		del /S /Q %dir%\libraries\net\minecraft\launchwrapper
		del /S /Q %dir%\libraries\net\impactclient
		del /S /Q %dir%\libraries\net\jodah\typetools
		del /S /Q %dir%\libraries\io\jsonwebtoken
		del /S /Q %dir%\libraries\club\minnced\java-discord-rpc
		del /S /Q %dir%\libraries\org\ow2\asm
		del /S /Q %dir%\libraries\org\json\json

		//delete dir
		rd /S /Q %dir%\Impact\
		rd /S /Q %dir%\Baritone\
		rd /S /Q %dir%\libraries\cabaletta
		rd /S /Q %dir%\libraries\com\github\ImpactDevelopment
		rd /S /Q %dir%\libraries\com\github\ZeroMemes\Alpine
		rd /S /Q %dir%\libraries\net\minecraft\launchwrapper
		rd /S /Q %dir%\libraries\net\impactclient
		rd /S /Q %dir%\libraries\net\jodah\typetools
		rd /S /Q %dir%\libraries\io\jsonwebtoken
		rd /S /Q %dir%\libraries\club\minnced\java-discord-rpc
		rd /S /Q %dir%\libraries\org\ow2\asm
		rd /S /Q %dir%\libraries\org\json\json
		
		//delete correct version
		if %whattype%=="normal" (
			del /S /Q %dir%\versions\%delver%
			rd /S /Q %dir%\versions\%delver%
			echo Successfully deleted the version directory
		)
		if %whattype%=="forge" (
			echo You will need to remove the Impact mod from .minecraft/mods manually
		)
		if %whattype%=="nightly" (
			echo You will need to remove the Impact version folder from .minecraft/versions manually
		)
		if %whattype%=="other" (
			echo You will need to remove the Impact version folder from .minecraft/versions manually
		)
	
	echo Finished!
	pause
	goto homemenu
	:uideny
	cls
	echo Repair Stopped
	pause
	goto homemenu

::===uninstallbaritone===
:uninstallbaritone
cls
echo This will remove baritone, and will remove the config too, are you sure you want to continue?
echo please type "yes" or "no"
set /p select=Please type an option: 
if "%select%" == "yes" goto uballow
if "%select%" == "no" goto ubdeny
echo %select% is not a choice, please type yes or no
pause
goto uninstallbaritone

	:uballow
	cls
	del /S /Q %dir%\Baritone\
	rd /S /Q %dir%\Baritone\
	echo You will need to remove the Baritone mod from .minecraft/mods manually
	echo Finished!
	pause
	goto homemenu
	:ubdeny
	cls
	echo Repair Stopped
	pause
	goto homemenu

::===rcimpact===
:rcimpact
cls
echo This will remove impacts + baritones config, are you sure you want to continue?
echo please type "yes" or "no"
set /p select=Please type an option: 
if "%select%" == "yes" goto rciallow
if "%select%" == "no" goto rcideny
echo %select% is not a choice, please type yes or no
pause
goto rcimpact
	
	:rciallow
	cls
	del /S /Q %dir%\Impact\
	del /S /Q %dir%\Baritone\
	rd /S /Q %dir%\Impact\
	rd /S /Q %dir%\Baritone\
	echo Finished!
	pause
	goto homemenu
	:rcideny
	cls
	echo Repair Stopped
	pause
	goto homemenu

::===rcbaritone===
:rcbaritone
cls
echo This will remove baritones config, are you sure you want to continue?
echo please type "yes" or "no"
set /p select=Please type an option: 
if "%select%" == "yes" goto rcballow
if "%select%" == "no" goto rcbdeny
echo %select% is not a choice, please type yes or no
pause
goto rcbaritone
	
	:rcballow
	cls
	del /S /Q %dir%\Baritone\
	rd /S /Q %dir%\Baritone\
	echo Finished!
	pause
	goto homemenu
	:rcbdeny
	cls
	echo Repair Stopped
	pause
	goto homemenu

::===tlauncher===
:tlauncher
cls
start https://www.youtube.com/watch?v=dQw4w9WgXcQ
echo Buy the game and use impact
echo dont pirate games next time :3
pause
goto homemenu

::===menuexit===
:menuexit
cls
echo Thank you for using this software, it is currently in beta although, so please keep that in mind
pause
exit
