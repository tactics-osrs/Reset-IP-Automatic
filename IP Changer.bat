rem This script will reset your IP address and DNS servers to be obtained automatically, which is the default setting for most networks.
@echo off
setlocal enabledelayedexpansion
:: Get the names of all network interfaces
for /f "tokens=1,2*" %%i in ('netsh interface ipv4 show interfaces ^| findstr /C:"Connected"') do (
    set "name=%%k"

    :: Remove leading and trailing spaces from the interface name
    set "name=!name:~1,-1!"

    :: Reset IP address and DNS servers for each interface
    netsh interface ip set address name="!name!" dhcp
    netsh interface ip set dnsservers name="!name!" dhcp
)
echo Your IP address and DNS servers have been reset to be obtained automatically.
pause
