@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=[%%c.%%a.%%b])
::For /f "tokens=1-4 delims=/:" %%a in ('time /t') do (set mytime=[%%a.%%b])

set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
set SS=%TIME:~6,2%
set mytime=[%HH%.%MM%.%SS%]

set mydir="%mydate%%mytime%"

mkdir %mydir%

