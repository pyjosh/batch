
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=[%%c.%%a.%%b])

set HH=%TIME:~0,2%
set MM=%TIME:~3,2%
set SS=%TIME:~6,2%
set mytime=[%HH%.%MM%.%SS%]

echo %mydate%%mytime%_| clip
