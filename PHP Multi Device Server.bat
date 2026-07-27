@echo off
TITLE Laravel Herd Multi-Device & Ngrok Selector
color 0b

:: 1. Ambil khusus IPv4 Address yang aktif (mengabaikan fe80/IPv6)
FOR /F "tokens=2 delims=:" %%a IN ('ipconfig ^| findstr /i "IPv4"') DO (
    set "IP=%%a"
    goto :get_ip
)
:get_ip
set "IP=%IP: =%"

cls
echo ========================================================
echo        PILIH PROJECT LARHERD DI D:\SITES
echo ========================================================
echo.

setlocal enabledelayedexpansion
set "count=0"

:: 2. Menampilkan daftar folder di D:\Sites
for /d %%D in (D:\Sites\*) do (
    set /a count+=1
    set "project[!count!]=%%~nxD"
    echo   [!count!] %%~nxD
)

echo.
echo ========================================================
set /p pilihan="Masukkan nomor project yang ingin dijalankan: "

:: Validasi pilihan
if not defined project[%pilihan%] (
    echo Pilihan tidak valid! Silakan coba lagi.
    pause >nul
    exit
)

:: Ambil nama folder pilihan
set "selected_project=!project[%pilihan%]!"
cls

echo ========================================================
echo  Project Dipilih: %selected_project%
echo ========================================================
echo  Pilih Mode Jaringan:
echo   [1] Lokal Network (WiFi yang sama / IP Laptop)
echo   [2] Online Publik via Ngrok (Bisa diakses dari internet luar)
echo ========================================================
set /p mode="Masukkan pilihan mode (1/2): "

cd /d "D:\Sites\%selected_project%"
cls

if "%mode%"=="1" (
    echo ========================================================
    echo  Menjalankan Server PHP Lokal
    echo  Akses dari HP/Laptop lain: http://%IP%:80
    echo ========================================================
    echo.
    php -S %IP%:80 -t public
    goto :end
)

if "%mode%"=="2" (
    :: Cek apakah ngrok terinstal di sistem
    where ngrok >nul 2>&1
    if %errorlevel% neq 0 (
        echo ========================================================
        echo  [ERROR] Ngrok belum terinstal atau belum ada di PATH!
        echo ========================================================
        echo Silakan unduh ngrok terlebih dahulu pada tautan resmi berikut:
        echo https://ngrok.com/download
        echo.
        echo Setelah diunduh, letakkan file ngrok.exe sejajar dengan script ini.
        echo ========================================================
        pause
        exit
    )

    echo ========================================================
    echo  Menjalankan Server PHP + Ngrok Tunnel
    echo ========================================================
    echo.
    :: Jalankan server PHP menggunakan IP lokal pada port 80 di background
    start /b php -S %IP%:80 -t public
    
    :: Beri jeda 2 detik agar server PHP siap sebelum ngrok menembusnya
    timeout /t 2 >nul

    :: Jalankan ngrok dengan mengarah ke IP dan port tersebut
    ngrok http %IP%:80
    goto :end
)

:end
pause