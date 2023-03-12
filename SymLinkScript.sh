#!/bin/bash

#Change directory of subshell to directory of script
cd "$(dirname "$0")"

echo "$(pwd)"

#get original user login info that invoked script
home="/home/"$(who am i | awk '{print $1}')""
eval home_dir=$home

#Compton compositor - not publishing updates - new package (in beta with bugs)
mkdir $home_dir/.config/compton && ln -sr compton/compton.conf $home_dir/.config/compton/compton.conf

#CREATE SYMBOLIC LINKS TO ALL CONFIGS#

#bash, vim, and urzvt (older terminal)
rm $home_dir/.bashrc && ln -sr .bashrc $home_dir/.bashrc
rm $home_dir/.bash_aliases || ln -sr .bash_aliases $home_dir/.bash_aliases
ln -sr .vimrc $home_dir/.vimrc
ln -sr .zshrc $home_dir/.zshrc
ln -sr .Xresources $home_dir/.Xresources #urxvt config
mkdir $home_dir/.config/urxvt/ && ln -sr urxvt/ext $home_dir/.config/urxvt/ext
xrdb $home_dir/.Xresources #trigger config reload for urxvt

#change default shell to zsh
sudo chsh -s $(which zsh)

#TODO: setup scheduled task to update zsh but download at first
cd $home_dir
echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $home_dir/.zshrc
#append existing aliases into zshrc
cat $home_dir/.bash_aliases >> .zshrc

