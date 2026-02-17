#!/usr/bin/env bash
# Определяем папку, где лежит этот скрипт
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Запускаем через nix-shell, используя относительные пути
nix-shell "$DIR/shell.nix" --run "steam-run $DIR/easyeda-linux-x64/easyeda"
