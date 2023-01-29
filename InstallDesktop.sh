#!/bin/bash

IFS=$'\n'

software = (
light,
vim,
ranger,
emacs,
ca-certificates,
curl,
gnupg,
lsb-release,
htop,
i3,
kazam
pavucontrol,
vlc,
obs-studio,
ffmpeg,
feh,
maim,
compton,
figlet,
lolcat,
imagemagick,
zsh,
fonts-powerline,
rxvt-unicode,
neofetch,
blueman,
virtualbox,
virtualbox-guest-additions-iso
)

#Download it, don't download, doesn't really matter :/
snap_packages = (
gotop
)

sudo add-apt-repository ppa:obsproject/obs-studio

for package in '${software[@]}'; do
	#-f to force reinstall
	sudo apt install -y -f "$package" || true
done

export EDITOR=vim

default_chrome='Default'
arm_chrome='Profile 1'

#setup permissions for video group needed for light package
usermod -aG video "$USER"

#Move my quirks to local executable
echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory='"$default_chrome"' --new-window" >> mob && chmod +x mob && sudo mv mob /usr/bin/

echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory='"$arm_chrome"' --new-window" >> mobb && chmod +x mobb && sudo mv mobb /usr/bin/

mkdir ~/.config/compton && ln -s compton/compton.conf ~/.config/compton/compton.conf

#Create symbolic links to all files
rm "$HOME"/.bashrc | ln -s .bashrc "$HOME"/.bashrc
ln -s .bash_aliases "$HOME"/.bash_aliases
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



