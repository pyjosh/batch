@echo off
dir %1 /-p /o:gn > "%temp%\Listing"
start /w notepad "%temp%\Listing"
::del "%temp%\Listing"
exit
