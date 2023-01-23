#!/bin/bash


#move all the otfs to the font directory
cp *.otf /usr/local/share/fonts/

#restart font-cache
sudo fc-cache -f -v
