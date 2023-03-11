#!/bin/bash

#Change directory of subshell to directory of script
cd "$(dirname "$0")"

echo "$(pwd)"

HOME="$(dirname "$0")"

mkdir "$HOME"/.config/compton && ln -s compton/compton.conf ~/.config/compton/compton.conf

#Create symbolic links to all files
rm "$HOME"/.bashrc && ln -s .bashrc "$HOME"/.bashrc
rm "$HOME"/.bash_aliases && ln -s .bash_aliases "$HOME"/.bash_aliases
ln -s .vimrc "$HOME"/.vimrc
ln -s .zshrc "$HOME"/.zshrc
ln -s .Xresources "$HOME"/.Xresources #urxvt config
mkdir "$HOME"/.config/urxvt/ && ln -s urxvt/ext
xrdb "$HOME"/.Xresources #trigger config reload for urxvt

#change default shell to zsh
sudo chsh -s $(which zsh)

#TODO: setup scheduled task to update zsh but download at first
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#TODO: add bash aliases as appended input to omyzshrc
