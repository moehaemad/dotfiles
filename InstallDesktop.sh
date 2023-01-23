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
compton
)

sudo add-apt-repository ppa:obsproject/obs-studio

for package in '${software[@]}'; do
	#-f to force reinstall
	sudo apt install -y -f "$package" || true
done
