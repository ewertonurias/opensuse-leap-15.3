#!/bin/bash

printf "\nEtapa 1/8: Atualizando o sistema... \n"
sudo zypper ref && sudo zypper up

printf "\nEtapa 2/8: Instalando codecs de áudio e vídeo... \n"
sudo zypper install opi && opi codecs

printf "\nEtapa 3/8: Atualizando o Firefox para a versão mais recente... \n"
sudo zypper ar -cfp 90 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.3/ mozilla
sudo zypper dup --from mozilla --allow-vendor-change

printf "\nEtapa 4/8: Instalando o driver proprietário NVIDIA... \n"
sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
sudo zypper ref
sudo zypper install x11-video-nvidiaG05

printf "\nEtapa 5/8: Instalando pacotes de jogos... \n"
sudo zypper install wine-staging lutris steam discord obs-studio

printf "\nEtapa 6/8: Instalando fontes TrueType da Microsoft... \n"
sudo zypper install fetchmsttfonts

printf "\nEtapa 7/8: Instalando softwares diversos... \n"
sudo zypper install k{get,rita,colorchooser,denlive} sweeper partitionmanager inkscape telegram-desktop qbittorrent neofetch ristretto feh youtube-dl

printf "\nEtapa 8/8: Alterando o nome do hostname para @opensuse-desktop... \n"
sudo hostnamectl set-hostname opensuse-desktop

#End of the script.
printf "\nFIM DO SCRIPT \n\n"
