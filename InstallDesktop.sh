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
lolcat
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

default_chrome='Default'
arm_chrome='Profile 1'

#Move my quirks to local executable
echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory="$default_chrome" --new-window" >> mob && chmod +x mob && sudo mv mob /usr/bin/

echo -e "#!/bin/bash\n\ngoogle-chrome --profile-directory="$arm_chrome" --new-window" >> mobb && chmod +x mobb && sudo mv mobb /usr/bin/

mkdir ~/.config/compton && ln -s compton/compton.conf ~/.config/compton/compton.conf

