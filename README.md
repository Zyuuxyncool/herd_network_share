# PHP Multi Device Server (Herd Network Share)

*( 🇺🇸 English version | 🇮🇩 Versi Bahasa Indonesia di bawah )*

---

## 🇺🇸 English Version

A lightweight and interactive script for Windows (`.bat`) and macOS (`.command`). It allows you to easily share your local Laravel projects (or any PHP projects) across multiple devices on the same local network (LAN) or publicly via Ngrok tunnels.

### Features

* **Interactive Project Selector:** Automatically scans and lists all of your local projects inside your `Sites` directory (`D:\Sites` on Windows, `~/Sites` on macOS).
* **Automatic IP Detection:** Automatically retrieves your active local IPv4 address.
* **Dual-Mode Sharing:**
  1. **Local Network Mode:** Share your project with phones, tablets, or other PCs connected to the same WiFi.
  2. **Ngrok Public Mode:** Expose your local project to the internet via Ngrok with built-in dependency check.

### Requirements

* **OS:** Windows or macOS.
* **PHP:** Must be installed and accessible globally (included with Laravel Herd).
* **Ngrok:** *(Optional, required only if you want to use the public tunnel mode)*. Download from [ngrok.com](https://ngrok.com/download).

### Installation & Usage

#### For Windows Users
1. Place the `PHP multi Device Server.bat` file in your desired directory (e.g., `D:\Sites`).
2. *(Optional)* Place `ngrok.exe` in the same folder as the script.
3. Double-click the `.bat` file to run the interactive menu.

#### For macOS Users
1. Place the `PHP multi Device Server.command` file in your `~/Sites` directory.
2. Open Terminal and make the file executable by running:
   ```bash
   chmod +x ~/Sites/"PHP multi Device Server.command"
