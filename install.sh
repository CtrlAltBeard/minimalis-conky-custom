#!/bin/bash

# Install dependencies
if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y conky-all lsb-release
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm conky-lua lsb-release
elif command -v dnf &> /dev/null; then
    sudo dnf install -y conky lsb-release
else
    echo "Unsupported package manager. Install conky and lsb-release manually."
    exit 1
fi

# Copy config
cp conky.conf ~/.conkyrc

# Set up autostart
mkdir -p ~/.config/autostart
cp conky.desktop ~/.config/autostart/

# Font check
if [ ! -f ~/.local/share/fonts/ConkySymbols.ttf ]; then
    echo "⚠️ ConkySymbols.ttf not found in ~/.local/share/fonts/"
    echo "Download it from: https://www.gnome-look.org/p/1112273"
    echo "Then run: cp ConkySymbols.ttf ~/.local/share/fonts/ && fc-cache -fv"
fi

# Verify conky
echo "Testing Conky..."
conky &
sleep 2
pkill conky

echo "✅ Installation complete!"
echo "Run 'conky &' to start manually, or reboot to test autostart."
