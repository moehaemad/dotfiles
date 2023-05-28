#!/bin/bash

IFS=$'\n'

software=(
light
vim
ranger
emacs
ca-certificates
curl
gnupg,
lsb-release
htop
i3
kazam
pavucontrol
vlc
obs-studio
ffmpeg
feh
maim
compton
figlet
lolcat
imagemagick
zsh
fonts-powerline
rxvt-unicode
neofetch
blueman
virtualbox
virtualbox-guest-additions-iso
cal
nginx
php
net-tools
ruby-full
okular
xclip
)

#Download it, don't download, doesn't really matter :/
snap_packages=(
gotop,
intellij-idea-community --classic
)

#Remove Ubuntu's bad snap package manager (Causes dependencies to break on packages and obliterated my previous desktop with help from nvidia drivers)
#sudo apt autoremove --purge snapd && sudo apt-mark hold snapd

#sudo add-apt-repository ppa:obsproject/obs-studio

for package in "${software[@]}"; do
	#-f to force reinstall
	sudo apt install -y -f "$package" || true
done

#TODO: fix this at some point or prompt with default link with idk some pgp signature if the download supports it
echo "Need a link to download a .tar.gz file or .deb package install"
echo "Discord, Intellij, DaVinciResolve ..."


#refresh font cache for powerline fonts
fc-cache -f -v
#set ohmyzsh theme to agnoster because it makes me look like I know what I'm doing
omz theme set agnoster

export EDITOR=vim

default_chrome='Default'
arm_chrome='Profile 1'

#setup permissions for video group needed for light package
usermod -aG video "$USER"

#Move my quirks to local executable
echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory='"$default_chrome"' --new-window" >> mob && chmod +x mob && sudo mv mob /usr/bin/

echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory='"$arm_chrome"' --new-window" >> mobb && chmod +x mobb && sudo mv mobb /usr/bin/

bash SymLinkScript.sh
