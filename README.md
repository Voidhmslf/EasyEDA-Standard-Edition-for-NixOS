# 🔌 EasyEDA for NixOS

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?logo=nixos&logoColor=white)](https://nixos.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple, robust wrapper to run **EasyEDA Standard Edition** on NixOS. This project solves the common "missing shared libraries" issues (like `libnss3.so`) by using a custom FHS (Filesystem Hierarchy Standard) environment powered by `steam-run`.



---

## 🚀 Why this exists?

EasyEDA is distributed as a pre-compiled Electron binary. On traditional Linux distributions, it expects libraries to be in `/usr/lib`. Since NixOS follows a different philosophy, simply running the binary leads to errors like:
`error while loading shared libraries: libnss3.so: cannot open shared object file`

This repository provides a **Nix-shell** configuration that creates a "virtual" traditional Linux environment with all the necessary dependencies (GTK3, NSS, X11, etc.) to make EasyEDA feel right at home.

---

## 🛠️ Installation & Usage

### 1. Download EasyEDA
Go to the [Official EasyEDA Download Page](https://easyeda.com/page/download) and download the **Linux x64** archive for the **Standard Edition**.

### 2. Clone this Repository
```bash
git clone [https://github.com/YourUsername/easyeda-nixos-wrapper.git](https://github.com/YourUsername/easyeda-nixos-wrapper.git)
cd easyeda-nixos-wrapper

```

### 3. Prepare the Files

1. Extract the downloaded EasyEDA zip file.
2. Move the extracted folder (usually named `easyeda-linux-x64`) into this repository folder.
3. Your directory structure should look like this:
```text
.
├── easyeda-linux-x64/   # The extracted app folder
├── shell.nix            # Nix environment config
├── run.sh               # Universal launch script
└── install_shortcut.sh  # Desktop entry creator

```

### 4. Create Desktop Shortcut

Run the installation script to add EasyEDA to your application menu:

```bash
chmod +x install_shortcut.sh
./install_shortcut.sh

```

*Now you can launch EasyEDA from your app launcher (Rofi, Wofi, GNOME, KDE, etc.)!*

---

## 🖥️ Manual Launch

If you prefer using the terminal, simply run:

```bash
./run.sh

```

*Note: The first launch might take a moment as Nix downloads the required dependencies.*

---

## 📝 Technical Details

The `shell.nix` included in this repo uses `steam-run` with an `override`. We’ve injected the following critical libraries to ensure Electron runs smoothly:

* **NSS & NSPR** (For network security)
* **GTK3 & Cairo** (Для rendering the UI)
* **X11 Libraries** (Composite, Damage, RandR, etc.)
* **ALSA** (For audio support)

---

## ⚖️ Legal Disclaimer

**EasyEDA** is a proprietary software owned by LCEDA. This repository **does not** contain any EasyEDA binary files. It only provides configuration scripts to help NixOS users run the software they have legally downloaded from the official source.

---

## 🤝 Contributing

Feel free to open an Issue or a Pull Request if you find a missing library or want to improve the Nix expression!

**Created by [VoidHimself**](https://github.com/Voidhmslf) 🦊
