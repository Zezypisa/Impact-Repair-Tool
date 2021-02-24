@echo OFF

::===startup===
:startup
set dir=%userprofile%\Appdata\Roaming\.minecraft
goto homemenu

::===homemenu===
:homemenu
title Impact Repair Tool
cls
echo Welcome to Impact Repair Tool!
echo Make sure Minecraft is closed when using this
echo This file alone only works for windows and default MC launcher
echo ===Select Repair Option===
echo 1) Uninstall Impact
echo 2) Uninstall Baritone
echo 3) Remove config for Impact
echo 4) Remove config for Baritone
echo 5) Tlauncher / 3rd party launcher fix
echo type "EXIT" to exit
set /p select=Please Type an Option: 
if "%select%" EQU "1" goto uninstallimpact
if "%select%" EQU "2" goto uninstallbaritone
if "%select%" EQU "3" goto rcimpact
if "%select%" EQU "4" goto rcbaritone
if "%select%" EQU "5" goto tlauncher
if "%select%" EQU "exit" goto menuexit
echo %select% is not a choice, please type a number
pause
goto homemenu

::===uninstallimpact===
:uninstallimpact
cls
echo This will remove impact, and will remove the config too, are you sure you want to continue?
echo please type "yes" or "no"
set /p select=Please type an option: 
if "%select%" EQU "yes" goto uiallow
if "%select%" EQU "no" goto uideny
echo %select% is not a choice, please type yes or no
pause
goto uninstallimpact

	:uiallow
	cls
	echo Please type out the version to use
	echo type "EXIT" to exit
	set /p chooseVer=Please type a version / forge / nightly (with quotes surrounding it): 
	if %chooseVer%=="1.11.2" (
		set delver="1.11.2-Impact_4.0"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.12" (
		set delver="1.12-Impact_4.0"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.12.1" (
		set delver="1.12.1-Impact_4.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.12.2" (
		set delver="1.12.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.13.2" (
		set delver="1.13.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.14.4" (
		set delver="1.14.4-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.15.2" (
		set delver="1.15.2-Impact_4.9.1"
		set whattype="normal"
		goto uiallow2
	)
	if %chooseVer%=="1.16.4" (
		set delver="1.16.4-Impact_nightly-20210115"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%=="1.16.5" (
		set delver="1.16.4-Impact_nightly-20210223"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%=="forge" (
		set delver="none"
		set whattype="forge"
		goto uiallow2
	)
	if %chooseVer%=="nightly" (
		set delver="none"
		set whattype="nightly"
		goto uiallow2
	)
	if %chooseVer%=="exit" (
		goto homemenu
	)
	echo %chooseVer% is not a choice, please type a version
	pause
	goto uiallow
	
		:uiallow2
		//delete files in dir
		del /S /Q "%dir%\Impact\
		del /S /Q "%dir%\Baritone\
		del /S /Q "%dir%\libraries\cabaletta
		del /S /Q "%dir%\libraries\com\github\ImpactDevelopment

		//delete dir
		rd /S /Q "%dir%\Impact\
		rd /S /Q "%dir%\Baritone\
		rd /S /Q "%dir%\libraries\cabaletta
		rd /S /Q "%dir%\libraries\com\github\ImpactDevelopment

		//delete correct version
		if %whattype%=="normal" (
			del /S /Q "%dir%\versions\%delver%
			rd /S /Q "%dir%\versions\%delver%
			echo Successfully deleted the version directory
		)
		if %whattype%=="forge" (
			echo You will need to remove the Impact mod from .minecraft/mods manually
		)
		if %whattype%=="nightly" (
			echo You will need to remove the Impact folder from .minecraft/versions manually
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
if "%select%" EQU "yes" goto uballow
if "%select%" EQU "no" goto ubdeny
echo %select% is not a choice, please type yes or no
pause
goto uninstallbaritone

	:uballow
	cls
	del /S /Q "%dir%\Baritone\
	rd /S /Q "%dir%\Baritone\
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
if "%select%" EQU "yes" goto rciallow
if "%select%" EQU "no" goto rcideny
echo %select% is not a choice, please type yes or no
pause
goto rcimpact
	
	:rciallow
	cls
	del /S /Q "%dir%\Impact\
	del /S /Q "%dir%\Baritone\
	rd /S /Q "%dir%\Impact\
	rd /S /Q "%dir%\Baritone\
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
if "%select%" EQU "yes" goto rcballow
if "%select%" EQU "no" goto rcbdeny
echo %select% is not a choice, please type yes or no
pause
goto rcbaritone
	
	:rcballow
	cls
	del /S /Q "%dir%\Baritone\
	rd /S /Q "%dir%\Baritone\
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
