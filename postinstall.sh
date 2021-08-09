#!/bin/bash

# Update repositories and upgrade packages
printf "\nEtapa 1/10: Atualizando o sistema... \n"
sudo zypper ref && sudo zypper up

# Install codecs from Packman repositories
printf "\nEtapa 2/10: Instalando codecs de áudio e vídeo... \n"
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$releasever/' packman
sudo zypper ref
sudo zypper dup --from packman --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codec-gstreamer

## Update MozillaFirefox from Mozilla repositories (Optional)
# printf "\nAtualizando o Firefox para a versão mais recente... \n"
# sudo zypper addrepo -cfp 90 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.3/ mozilla
# sudo zypper dup --from mozilla --allow-vendor-change

# Install NVIDIA driver from NVIDIA repositories
printf "\nEtapa 3/10: Instalando o driver proprietário NVIDIA... \n"
sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
sudo zypper ref && sudo zypper install x11-video-nvidiaG05

# Add Emulators repository
printf "\nEtapa 4/10: Adicionando repositório de emuladores... \n"
sudo zypper addrepo http://download.opensuse.org/repositories/Emulators/openSUSE_Leap_15.3/Emulators.repo
sudo zypper ref

# Install game packages
printf "\nEtapa 5/10: Instalando pacotes de jogos... \n"
sudo zypper install wine-staging lutris steam discord obs-studio

# Intall emulator packages
printf "\nEtapa 6/10: Instalando emuladores... \n"
sudo zypper install dolphin-emu pcsx2 retroarch

# Install GameMode support
printf "\nEtapa 7/10: Instalando Feral GameMode... \n"
sudo zypper install libgamemode{auto0,auto0-32bit,0-32bit}

# Install TrueType Fonts Microsoft
printf "\nEtapa 8/10: Instalando fontes TrueType da Microsoft... \n"
sudo zypper install fetchmsttfonts

# Install common software
printf "\nEtapa 9/10: Instalando softwares diversos... \n"
sudo zypper install k{get,rita,colorchooser,denlive} p{7zip-full,artitionmanager} unrar inkscape telegram-desktop qbittorrent neofetch ristretto feh youtube-dl sweeper vokoscreenNG

# Change the hostname
printf "\nEtapa 10/10: Alterando o hostname para @opensuse-desktop... \n"
sudo hostnamectl set-hostname opensuse-desktop

# End of the script.
printf "\nFIM DO SCRIPT \n\n"
