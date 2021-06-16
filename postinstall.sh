#!/bin/bash

printf "\nEtapa 1/9: Atualizando o sistema... \n"
sudo zypper ref && sudo zypper up

printf "\nEtapa 2/9: Instalando codecs de áudio e vídeo... \n"
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$releasever/' packman
sudo zypper ref
sudo zypper dup --from packman --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codecs

printf "\nEtapa 3/9: Atualizando o Firefox para a versão mais recente... \n"
sudo zypper ar -cfp 90 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.3/ mozilla
sudo zypper dup --from mozilla --allow-vendor-change

printf "\nEtapa 4/9: Instalando o driver proprietário NVIDIA... \n"
sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
sudo zypper ref
sudo zypper install x11-video-nvidiaG05

printf "\nEtapa 5/9: Instalando pacotes de jogos... \n"
sudo zypper install wine-staging lutris steam discord obs-studio

printf "\nEtapa 6/9: Instalando fontes TrueType da Microsoft... \n"
sudo zypper install fetchmsttfonts

printf "\nEtapa 7/9: Instalando softwares diversos... \n"
sudo zypper install k{get,rita,colorchooser,denlive} sweeper partitionmanager inkscape telegram-desktop qbittorrent neofetch ristretto feh youtube-dl unrar p7zip-full

printf "\nEtapa 8/9: Adicionando o repositório de emuladores... \n"
sudo zypper addrepo http://download.opensuse.org/repositories/Emulators/openSUSE_Leap_15.3/Emulators.repo
sudo zypper ref
sudo zypper install pcsx2

printf "\nEtapa 9/9: Alterando o hostname para @opensuse-desktop... \n"
sudo hostnamectl set-hostname opensuse-desktop

#End of the script.
printf "\nFIM DO SCRIPT \n\n"
