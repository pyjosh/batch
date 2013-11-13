ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET Path=%path%;"C:/Program Files (x86)/Git/bin/"
FOR /f %%G in ('dir /ad /b "."') DO (
cd %%G
git.exe rev-list -n 1 --before="2012-03-01 00:00" master>../githash.txt
echo *******************
echo %%G
echo *******************
set /P version=<../githash.txt
git checkout !version!
cd ..
)
pause
