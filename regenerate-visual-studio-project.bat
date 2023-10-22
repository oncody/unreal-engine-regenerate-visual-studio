@echo off
setlocal enabledelayedexpansion

set "engineVersion=UE_5.3"
set "enginePath=D:\Programs\Unreal Engine\%engineVersion%\Engine"

set "projectPath=D:\Code\unreal-engine-multiplayer-shooter"
set "projectName=Blaster.uproject"

REM Define the directories to remove
set "dirsToRemove=Plugins\MultiplayerSessions\Binaries Plugins\MultiplayerSessions\Intermediate Binaries Intermediate Saved DerivedDataCache"

REM Loop through and print the directory to be checked or removed
for %%d in (%dirsToRemove%) do (
    set "dirPath=!projectPath!\%%d"
    if exist "!dirPath!" (
        rmdir /s /q "!dirPath!"
    ) else (
        rem echo Directory "!dirPath!" does not exist.
    )
)

REM Check for remaining directories
set "remainingDirs="
for %%d in (%dirsToRemove%) do (
    set "dirPath=!projectPath!\%%d"
    if exist "!dirPath!" (
        set "remainingDirs=!remainingDirs! %%d"
    )
)

REM Display appropriate messages
if not "%remainingDirs%"=="" (
    echo Unable to delete directories:%remainingDirs%
) else (
    echo All directories successfully deleted.
)

echo Remember to manually regenerate your Visual Studio project files or you won't be able to build.
echo Script completed.
pause
