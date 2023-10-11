@echo off
setlocal

set "engineVersion=UE_5.3"
set "enginePath=D:\Programs\Unreal Engine\%engineVersion%\Engine"

set "projectPath=D:\Code\unreal-engine-multiplayer-plugin-menu-system"
set "projectName=MultiplayerMenu.uproject"



REM Define the directories to remove
set "dirsToRemove=Plugins\MultiplayerSessions\Binaries 
Plugins\MultiplayerSessions\Intermediate 
Binaries 
Intermediate 
Saved"

REM Loop through and remove each directory
for %%d in (%dirsToRemove%) do (
    set "dirPath=%projectPath%\%%d"
    if exist "!dirPath!" (
        echo Removing directory "!dirPath!"
        rmdir /s /q "!dirPath!"
    )
)

REM Run the UnrealBuildTool command
"%enginePath%\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" -projectfiles -project=%projectPath%\%projectName%

echo Script completed.
pause
