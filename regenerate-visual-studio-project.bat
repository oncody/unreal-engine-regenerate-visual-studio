@echo off
setlocal enabledelayedexpansion

set "engineVersion=UE_5.3"
set "enginePath=D:\Programs\Unreal Engine\%engineVersion%\Engine"

set "projectPath=D:\Code\unreal-engine-multiplayer-shooter"
set "projectName=Blaster.uproject"

REM Define the directories to remove
set "dirsToRemove=Plugins\MultiplayerSessions\Binaries Plugins\MultiplayerSessions\Intermediate Binaries Intermediate Saved"

REM Loop through and print the directory to be checked or removed
for %%d in (%dirsToRemove%) do (
    set "dirPath=!projectPath!\%%d"
    echo Checking directory "!dirPath!"
    if exist "!dirPath!" (
        echo Removing directory "!dirPath!"
        rmdir /s /q "!dirPath!"
    ) else (
        echo Directory "!dirPath!" does not exist.
    )
)

pause

REM Run the UnrealBuildTool command
"%enginePath%\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" -projectfiles -project="%projectPath%\%projectName%"

echo Script completed.
pause
