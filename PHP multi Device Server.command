#!/bin/bash

# Tentukan direktori Sites di Mac
SITES_DIR="$HOME/Sites"

# 1. Ambil IP Address lokal yang aktif di Mac
IP=$(ipconfig getifaddr en0 2>/dev/null)
if [ -z "$IP" ]; then
    IP=$(ipconfig getifaddr en1 2>/dev/null)
fi
if [ -z "$IP" ]; then
    IP="127.0.0.1"
fi

clear
echo "========================================================"
echo "        PILIH PROJECT LARAVEL DI ~/SITES"
echo "========================================================"
echo ""

# 2. Menampilkan daftar folder di ~/Sites
projects=()
i=1

for dir in "$SITES_DIR"/*/; do
    if [ -d "$dir" ]; then
        proj_name=$(basename "$dir")
        projects+=("$proj_name")
        echo "   [$i] $proj_name"
        ((i++))
    fi
done

echo ""
echo "========================================================"
read -p "Masukkan nomor project yang ingin dijalankan: " pilihan

# Validasi pilihan
index=$((pilihan - 1))
if [ -z "${projects[$index]}" ]; then
    echo "Pilihan tidak valid!"
    exit 1
fi

selected_project="${projects[$index]}"
clear

echo "========================================================"
echo " Project Dipilih: $selected_project"
echo "========================================================"
echo " Pilih Mode Jaringan:"
echo "   [1] Lokal Network (WiFi yang sama / IP Mac)"
echo "   [2] Online Publik via Ngrok (Bisa diakses dari internet luar)"
echo "========================================================"
read -p "Masukkan pilihan mode (1/2): " mode

# Masuk ke direktori project
cd "$SITES_DIR/$selected_project" || exit
clear

if [ "$mode" == "1" ]; then
    echo "========================================================"
    echo " Menjalankan Server PHP Lokal"
    echo " Akses dari HP/Laptop lain: http://$IP:8000"
    echo "========================================================"
    echo ""
    php -S "$IP:8000" -t public
elif [ "$mode" == "2" ]; then
    # Cek apakah ngrok terinstal
    if ! command -v ngrok &> /dev/null; then
        echo "========================================================"
        echo " [ERROR] Ngrok belum terinstal di sistem Mac Anda!"
        echo "========================================================"
        echo " Silakan unduh ngrok melalui Homebrew (jalankan di Terminal):"
        echo "   brew install --cask ngrok"
        echo " Atau unduh langsung di: https://ngrok.com/download"
        echo "========================================================"
        exit 1
    fi

    echo "========================================================"
    echo " Menjalankan Server PHP + Ngrok Tunnel"
    echo "========================================================"
    echo ""
    
    # Jalankan server PHP di background
    php -S "$IP:8000" -t public &
    PHP_PID=$!
    
    # Beri jeda 2 detik
    sleep 2
    
    # Jalankan ngrok
    ngrok http "$IP:8000"
    
    # Matikan server PHP jika ngrok ditutup
    kill $PHP_PID 2>/dev/null
else
    echo "Pilihan tidak valid."
fi
