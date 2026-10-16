#!/bin/bash
set -e
cd "$(dirname "$0")"

# ---------------------------------------------------------------
# 1. Dependencies (Debian/Mint/Ubuntu, Arch, Fedora)
# ---------------------------------------------------------------
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y conky-all lsb-release lm-sensors
elif command -v pacman &> /dev/null; then
    sudo pacman -S --needed --noconfirm conky lsb-release lm_sensors
elif command -v dnf &> /dev/null; then
    sudo dnf install -y conky lsb-release lm_sensors
else
    echo "Unsupported package manager. Install conky, lsb-release and lm-sensors manually."
    exit 1
fi

# ---------------------------------------------------------------
# 2. Battery detection (BAT0, BAT1, BATT, ... or none)
#    - Battery found   -> its name is injected into the config
#    - No battery      -> 'NONE' is injected, the path never
#                         exists so Conky hides the section
# ---------------------------------------------------------------
BAT=$(ls /sys/class/power_supply/ 2>/dev/null | grep -m1 '^BAT' || true)
if [ -n "$BAT" ]; then
    echo "Battery detected: $BAT"
else
    echo "No battery found — the Battery section will be hidden (desktop machine)."
    BAT="NONE"
fi

# ---------------------------------------------------------------
# 3. Install config (battery name injected via sed)
# ---------------------------------------------------------------
mkdir -p ~/.config/conky
sed "s/BATX/$BAT/g" conky.conf > ~/.config/conky/conky.conf
sed "s/BATX/$BAT/g" conky.conf > ~/.conkyrc
echo "Config installed to ~/.conkyrc and ~/.config/conky/conky.conf"

# ---------------------------------------------------------------
# 4. Autostart
# ---------------------------------------------------------------
mkdir -p ~/.config/autostart
cp conky.desktop ~/.config/autostart/
echo "Autostart entry installed to ~/.config/autostart/"

# ---------------------------------------------------------------
# 5. Font check
# ---------------------------------------------------------------
if [ ! -f ~/.local/share/fonts/ConkySymbols.ttf ]; then
    echo ""
    echo "⚠️  ConkySymbols.ttf not found in ~/.local/share/fonts/"
    echo "   Download it from: https://www.gnome-look.org/p/1112273"
    echo "   Then run: cp ConkySymbols.ttf ~/.local/share/fonts/ && fc-cache -fv"
fi

# ---------------------------------------------------------------
# 6. Done
# ---------------------------------------------------------------
echo ""
echo "✅ Installation complete!"
echo "   Start it now with:  conky &"
echo "   Or log out and back in to test autostart."
