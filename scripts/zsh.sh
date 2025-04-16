#!/bin/bash

echo "Start oh-my-zsh Config..."
echo "Current Path: $PWD"

mkdir -p "$PWD/files/root/.oh-my-zsh"

ROOT="$PWD/files/root"
ZSH="$ROOT/.oh-my-zsh"
ZSH_RC="$ROOT/.zshrc"
ZSH_CUSTOM="$ZSH/custom"

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

cp "$ZSH/templates/zshrc.zsh-template" "$ZSH_RC"

sed -i "s/ZSH_THEME=\".\+\"/ZSH_THEME=\"ys\"/" "$ZSH_RC"

sed -i "s/plugins=.\+/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/" "$ZSH_RC"
