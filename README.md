# Conky Minimalis Custom

A **personalized fork** of the [Minimalis Conky](https://www.gnome-look.org/p/1112273) theme by [deny26](https://www.gnome-look.org/u/deny26) ([OpenCode](https://www.opencode.net/deny26)).

This version includes:

- **Universal hardware support** — works out of the box on any machine:
  - **Network**: auto-detects your active interface (Wi-Fi or Ethernet, any name).
  - **Battery**: auto-detected at install time (`BAT0`, `BAT1`, `BATT`...); the whole section is hidden on desktops without one.
  - **GPU temp**: NVIDIA via `nvidia-smi`, with an automatic `sensors` fallback for AMD/Intel.
- Total CPU usage, per-core stats, temperature, RAM/SWAP, top processes, storage, network speeds, date &amp; clock.
- Section separators for a clean, readable layout.

---

## 📸 Screenshot

<img width="302" height="950" alt="conky" src="https://github.com/user-attachments/assets/feca87f2-55ef-4a7d-8006-72d4de687219" />

---

## 📦 Installation

### 1️⃣ Install the Theme

#### **Option A: Automatic (recommended)**

Works on Debian/Ubuntu/**Linux Mint**, **Arch**, and **Fedora**. The script installs dependencies, detects your battery and network setup, copies the config, and sets up autostart:

```bash
git clone https://github.com/CtrlAltBeard/minimalis-conky-custom.git
cd minimalis-conky-custom
chmod +x install.sh
./install.sh
conky &
```

#### **Option B: Manual Setup**

1. Install `conky`, `lsb-release` and `lm-sensors`:
  ```bash
   # Debian/Ubuntu/Linux Mint
   sudo apt update && sudo apt install conky-all lsb-release lm-sensors
  
   # Arch Linux
   sudo pacman -S conky lsb-release lm_sensors
  
   # Fedora
   sudo dnf install conky lsb-release lm_sensors
  ```
2. Copy the config:
  ```bash
   cp conky.conf ~/.conkyrc
   conky &
  ```
3. If you have a battery, replace `BATX` in `conky.conf` with your battery name (check with `ls /sys/class/power_supply/`). On desktops, no changes needed — the battery section hides itself.

#### **Font Setup**

- Download the **ConkySymbols.ttf** font from the [original theme](https://www.gnome-look.org/p/1112273) (included in the `Minimalis Conky 1.3.tar.gz` file).
- Install it:
  ```bash
  mkdir -p ~/.local/share/fonts
  cp ConkySymbols.ttf ~/.local/share/fonts/
  fc-cache -fv
  ```
- Also install **Roboto Mono** (`fonts-roboto` on Debian/Mint, `ttf-roboto` on Arch, `google-roboto-mono-fonts` on Fedora) or grab it from [Google Fonts](https://fonts.google.com/specimen/Roboto+Mono).

---

## 🚀 Run at Startup

The automatic installer already does this. Manually:

```bash
mkdir -p ~/.config/autostart
cp conky.desktop ~/.config/autostart/
```

Then log out and back in. Works on Cinnamon, MATE, Xfce, KDE and GNOME-based sessions.

---

## 🔧 Customisation

- **More/fewer CPU cores**: the config shows 4 cores. Add or remove lines following the `Core N` pattern (find your core count with `nproc`).
- **Position**: change `alignment`, `gap_x`, `gap_y` in `conky.config`.
- **Colours**: change `default_color` / `color1`.

---

## ❓ Troubleshooting

- **Conky doesn't start?**  
Run `conky` in a terminal to see the errors. Common cause: missing fonts (`ConkySymbols.ttf` or `Roboto Mono`).
- **Battery section missing?**  
Run the installer again (`./install.sh`) — it detects your battery automatically. Or check its name with `ls /sys/class/power_supply/` and edit `conky.conf`.
- **GPU temp not showing?**  
Check what your sensors report:
  ```bash
  sensors | grep -i temp
  ```
- **Network shows "Not connected"?**  
The theme auto-detects your active interface. If nothing is detected, check your connection with `ip link show`.

---

## 📜 License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE) for details.  
The original theme by [deny26](https://www.gnome-look.org/u/deny26) is GPL licensed.

---

## 🙏 Credits

- **Original Theme**: [Minimalis Conky](https://www.gnome-look.org/p/1112273) by [deny26](https://www.gnome-look.org/u/deny26) ([OpenCode](https://www.opencode.net/deny26))
- **Font**: ConkySymbols.ttf (included in the original theme download)
