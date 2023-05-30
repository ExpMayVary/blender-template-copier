@echo off

:: set path to your file and folders here
set BlenderPath="C:\path_to\blender.exe"
set SourceFileName=relative_path_to\file.blend
set DestinationFolderName=relative_path_to\destination_folder
set FileName=1.blend

:: Get the directory where the script is located
set ScriptDirectory=%~dp0

:: Generate the source file path and destination folder path
set SourceFilePath=%ScriptDirectory%%SourceFileName%
set DestinationFolderPath=%ScriptDirectory%%DestinationFolderName%

:: Generate a unique filename
setlocal enabledelayedexpansion
for /L %%i in (1,1,999) do (
    if not exist "!DestinationFolderPath!\!FileName!" (
        set "UniqueFileName=!DestinationFolderPath!\!FileName!"
        goto :copyfile
    )
    set "FileName=%%i.blend"
)
:copyfile
echo Unique file name: !UniqueFileName!

:: Copy the template file to the new location
copy "%SourceFilePath%" "!UniqueFileName!"

:: Open the newly created file with Blender
start "" %BlenderPath% "!UniqueFileName!"
