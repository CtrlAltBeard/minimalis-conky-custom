# Conky Minimalis Custom

A **personalized fork** of the [Minimalis Conky](https://www.gnome-look.org/p/1112273) theme by [deny26](https://www.opencode.net/deny26))([OpenCode](https://www.opencode.net/deny26)).

This version includes:

- GPU temperature monitoring.
- Adjusted layout for system stats (CPU, RAM, storage, top processes).
- Customized colors and fonts for better readability.

---

## 📸 Screenshot

> > Conky Preview

---

## 📦 Installation

### 1️⃣ **Install Dependencies**

#### **All Distros**

- Install `conky` and `lsb-release` (for OS info):
 ```bash
  # Debian/Ubuntu/Linux Mint
  sudo apt update && sudo apt install conky-all lsb-release
  
  # Arch Linux
  sudo pacman -S conky-lua lsb-release
  
  # Fedora
  sudo dnf install conky lsb-release
  ```

#### **Font Setup**

- Download the **ConkySymbols.ttf** font from the [original theme](https://www.gnome-look.org/p/1112273) (included in the `Minimalis Conky 1.3.tar.gz` file).
- Install it:
  ```bash
  mkdir -p ~/.local/share/fonts
  cp ConkySymbols.ttf ~/.local/share/fonts/
  fc-cache -fv
  ```

---

### 2️⃣ **Install the Theme**

#### **Option A: Manual Setup**

1. Clone this repo:
  ```bash
   git clone https://github.com/CtrlAltBeard/minimalis-conky-custom.git
   cd conky-minimalis-custom
  ```
2. Copy the config:
  ```bash
   cp conky.conf ~/.conkyrc
  ```
3. Test it:
  ```bash
   conky &
  ```

#### **Option B: Automatic Install (Linux Mint/Arch/Fedora)**

Run the `install.sh` script:

```bash
chmod +x install.sh
./install.sh
```

> *This will copy the config, set up autostart, and verify fonts.*

---

## 🚀 Run at Startup

### **Linux Mint (Cinnamon)**

1. Create a desktop entry:
  ```bash
   mkdir -p ~/.config/autostart
   cp conky.desktop ~/.config/autostart/
  ```
2. Log out and back in to apply.

### **Arch Linux (Any DE)**

- Use your DE’s autostart tool or add to `.xinitrc`:
  ```bash
  echo "conky &" >> ~/.xinitrc
  ```

### **Fedora (GNOME)**

- Use `gnome-tweaks` to add `conky` to startup applications.

---

## 📜 License

This project is licensed under **MIT License** – see [LICENSE](LICENSE) for details.  
The original theme by [deny26]([https://www.gnome-look.org/u/deny26](https://www.opencode.net/deny26/minimalis-conky-2)) is GNU GENERAL PUBLIC LICENSE licensed.

---

## 🙏 Credits

- **Original Theme**: [Minimalis Conky](https://www.gnome-look.org/p/1112273) by [deny26](https://www.opencode.net/deny26)
- **Font**: [ConkySymbols.ttf](https://www.gnome-look.org/p/1112273) (included in original download)
