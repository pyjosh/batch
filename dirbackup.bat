    @echo off
    :: variables
    set drive=E:/C_BACKUP
    set backupcmd=xcopy /s /c /d /e /h /i /r /y /q
    
    :: =============== SET DATES AND TIME IN FOLDER NAMES ====================================
    set hour=%time:~0,2%
    if "%hour:~0,1%"==" " set hour=0%time:~1,1%
    set folder=%date:~10,4%.%date:~4,2%.%date:~7,2%__%hour%.%time:~3,2%

    echo ### Backing up ECLIPSE IDE...
    %backupcmd% "C:\Users\josh\Eclipse_studio" "%drive%\[%folder%]_Eclipse_studio"
    
    echo ### Backing up PROJECTS...
    %backupcmd% "C:\Users\josh\Projects" "%drive%\[%folder%]_Projects"
    
    echo ### Backing up DOCS...
    %backupcmd% "C:\Users\josh\Desktop\[SD]" "%drive%\[%folder%]_[SD]"
    
    echo ### Backing up QT CREATOR PROJECTS...
    %backupcmd% "C:\Users\josh\Documents\QtCreatorProjects" "%drive%\[%folder%]_QtCreatorProjects"

    :: use below syntax to backup other directories...
    :: %backupcmd% "...source directory..." "%drive%\...destination dir..."

    echo Backup Complete!
    @pause




::  ==============================================================================================================================

:: XCOPY source [destination] [/A | /M] [/D[:date]] [/P] [/S [/E]] [/V] [/W] [/C] [/I] [/Q] [/F] [/L] [/H] [/R] [/T] [/U]
:: [/K] [/N] [/O] [/X] [/Y] [/-Y] [/Z] [/EXCLUDE:file1[+file2][+file3]...]

:: source	Specifies the file(s) to copy.
:: destination	Specifies the location or name of new files.
:: /A	Copies only files with the archive attribute set, doesn't change the attribute.
:: /M	Copies only files with the archive attribute set, turns off the archive attribute.
:: /D:m-d-y	Copies files changed on or after the specified date. If no date is given, copies only those files whose source time is newer than the destination time.
:: /EXCLUDE:file1 [+file2][+file3]...	Specifies a list of files containing strings. When any of the strings match any part of the absolute path of the file to be copied, that file will be excluded from being copied. For example, specifying a string like \obj\ or .obj will exclude all files underneath the directory obj or all files with the .obj extension respectively.
:: /P	Prompts you before creating each destination file.
:: /S	Copies directories and subdirectories except empty ones.
:: /E	Copies directories and subdirectories, including empty ones. Same as /S /E. May be used to modify /T.
:: /V	Verifies each new file.
:: /W	Prompts you to press a key before copying.
:: /C	Continues copying even if errors occur.
:: /I	If destination does not exist and copying more than one file, assumes that destination must be a directory.
:: /Q	Does not display file names while copying.
:: /F	Displays full source and destination file names while copying.
:: /L	Displays files that would be copied.
:: /H	Copies hidden and system files also.
:: /R	Overwrites read-only files.
:: /T	Creates directory structure, but does not copy files. Does not include empty directories or subdirectories. /T /E includes empty directories and subdirectories.
:: /U	Copies only files that already exist in destination.
:: /K	Copies attributes. Normal Xcopy will reset read-only attributes.
:: /N	Copies using the generated short names.
:: /O	Copies file ownership and ACL information.
:: /X	Copies file audit settings (implies /O).
:: /Y	Suppresses prompting to confirm you want to overwrite an existing destination file.
:: /-Y	Causes prompting to confirm you want to overwrite an existing destination file.
:: /Z	Copies networked files in restartable mode.
