# Herd Network Share

A lightweight and interactive Windows Batch (`.bat`) script designed for Laravel Herd users. It allows you to easily share your local Laravel projects (`D:\Sites`) across multiple devices on the same local network (LAN) or publicly via Ngrok tunnels.

## Features

* **Interactive Project Selector:** Automatically scans and lists all of your local Laravel projects inside `D:\Sites`.
* **Automatic IP Detection:** Automatically retrieves your active local IPv4 address, eliminating manual configuration.
* **Dual-Mode Sharing:**
  1. **Local Network Mode:** Share your project with phones, tablets, or other PCs connected to the same WiFi/LAN.
  2. **Ngrok Public Mode:** Expose your local project to the internet via Ngrok with built-in dependency check and download redirection.

## Requirements

* **Windows OS** (Command Prompt / Batch support)
* **PHP** (Included with Laravel Herd)
* **Ngrok** *(Optional, required only if you want to use the public tunnel mode)*

## Installation & Setup

1. Clone or download this repository into your machine.
2. Place the script file (`.bat`) inside your main projects directory (e.g., `D:\Sites\` or any preferred location).
3. *(Optional for Ngrok mode)* Download [Ngrok](https://ngrok.com/download) and place the `ngrok.exe` file in the **same folder** as this script.

## How to Use

1. Double-click the `.bat` file.
2. The script will display a numbered list of all your projects found in `D:\Sites`.
3. Type the number corresponding to the project you want to run and press **Enter**.
4. Choose your networking mode:
   * Type `1` for Local Network access (will provide a local URL like `http://192.168.x.x:8000`).
   * Type `2` for Public internet access via Ngrok.
5. Open the provided link in your browser or mobile device!

## License

This project is open-source and available under the [MIT License](LICENSE).
