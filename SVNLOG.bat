SETLOCAL enableextensions enabledelayedexpansion
ECHO off

:: change Working Directory to current path
CD %~dp0

:: configure url(s) to repositories - please put URLs in brackets ending each line with "^"
SET URL_LIST=()
:: navigate to svn.exe
SET SVN_EXE=
:: in case credentials are requested for repository connection define them here
SET USER=
SET PASSWORD=

:: ---------------------------------------------------
::  DO NOT MODIFY ANYTHING BELOW THIS LINE
:: ---------------------------------------------------
SET RESULT_DIR=%~dp0\svnlogs
IF NOT EXIST "%RESULT_DIR%" MKDIR "%RESULT_DIR%"


SET /A COUNT=0
FOR %%A IN %URL_LIST% DO (
	SET /A COUNT+=1
	ECHO Ectracting log for: %%A 
	%SVN_EXE% log --trust-server-cert --non-interactive --no-auth-cache --username %USER% --password %PASSWORD% -v --xml %%A > %RESULT_DIR%/!COUNT!_svnlog.xml
	ECHO SVN log saved to: %RESULT_DIR%/!COUNT!_svnlog.xml
)
endlocal


:: ===========================================================================================
:: EXAMPLES 
:: ===========================================================================================

:: -------------------------------------------------------------------------------------------
:: configuration for 1 URL
:: -------------------------------------------------------------------------------------------
::
::		:: Change Working Directory to current path
::		CD %~dp0
::
::		:: please configure url(s) to repositories
::		SET URL_LIST=(http://core.svn.wordpress.org/trunk/)
::		SET SVN_EXE="E:\tooling\ThirdParties\Subversion_1.6.13\svn.exe"
::		SET USER=
::		SET PASSWORD=
::
::
::		SET RESULT_DIR=%~dp0\svnlogs
::		IF NOT EXIST "%RESULT_DIR%" mkdir "%RESULT_DIR%"
::
::		SET /A COUNT=0
::		FOR %%A IN %URL_LIST% DO (
::			SET /A COUNT+=1
::			ECHO Ectracting log for: %%A 
::			%SVN_EXE% log --trust-server-cert --non-interactive --no-auth-cache --username %USER% --password %PASSWORD% -v --xml %%A > %RESULT_DIR%/!COUNT!_svnlog.xml
::			ECHO SVN log saved to: %RESULT_DIR%/!COUNT!_svnlog.xml
::		)
::		endlocal


:: -------------------------------------------------------------------------------------------
:: configuration for 2 or more URLs
:: -------------------------------------------------------------------------------------------
::
::		:: Change Working Directory to current path
::		CD %~dp0
::
::		:: please configure url(s) to repositories
::		SET URL_LIST=(http://core.svn.wordpress.org/trunk/ ^
::		http://core.svn.wordpress.org/branches/2.2/wp-admin/ ^
::		http://core.svn.wordpress.org/branches/2.2/wp-admin2/)
::		SET SVN_EXE="E:\tooling\ThirdParties\Subversion_1.6.13\svn.exe"
::		SET USER=richard.tooler
::		SET PASSWORD=4629djdfd9
::
::
::		SET RESULT_DIR=%~dp0\svnlogs
::		IF NOT EXIST "%RESULT_DIR%" mkdir "%RESULT_DIR%"
::
::		SET /A COUNT=0
::		FOR %%A IN %URL_LIST% DO (
::			SET /A COUNT+=1
::			ECHO Ectracting log for: %%A 
::			%SVN_EXE% log --trust-server-cert --non-interactive --no-auth-cache --username %USER% --password %PASSWORD% -v --xml %%A > %RESULT_DIR%/!COUNT!_svnlog.xml
::			ECHO SVN log saved to: %RESULT_DIR%/!COUNT!_svnlog.xml
::		)
::		endlocal