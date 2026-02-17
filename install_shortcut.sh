#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_DIR="$HOME/.local/share/applications"
mkdir -p "$APP_DIR"

cat > "$APP_DIR/easyeda.desktop" <<EOF
[Desktop Entry]
Name=EasyEDA
Comment=PCB Design Tool
Exec="$DIR/run.sh"
Icon=$DIR/easyeda-linux-x64/icon/256x256/easyeda.png
Terminal=false
Type=Application
Categories=Development;Electronics;
EOF

echo "Ярлык создан! Ищи EasyEDA в меню приложений."
