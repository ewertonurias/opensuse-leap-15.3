#!/bin/bash

### Atualiza repositórios e pacotes
printf "\nEtapa 1/10: Atualizando o sistema... \n"
sudo zypper ref && sudo zypper up

### Instala codecs do repositório Packman
printf "\nEtapa 2/10: Instalando codecs de áudio e vídeo... \n"
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$releasever/' packman
sudo zypper ref
sudo zypper dup --from packman --allow-vendor-change
sudo zypper install --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec-full vlc-codecs

### Adiciona o repositório Mozilla e atualiza para última versão (Opcional)
# printf "\nAtualizando o Firefox para a versão mais recente... \n"
# sudo zypper addrepo -cfp 90 http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.3/ mozilla
# sudo zypper dup --from mozilla --allow-vendor-change

### Driver proprietário NVIDIA
printf "\nEtapa 3/10: Instalando o driver proprietário NVIDIA... \n"
sudo zypper addrepo --refresh 'https://download.nvidia.com/opensuse/leap/$releasever' NVIDIA
sudo zypper ref && sudo zypper install x11-video-nvidiaG05

### Adiciona o repositório Emulators
printf "\nEtapa 4/10: Adicionando repositório de emuladores... \n"
sudo zypper addrepo http://download.opensuse.org/repositories/Emulators/openSUSE_Leap_15.3/Emulators.repo
sudo zypper ref

### Pacotes referentes a jogos
printf "\nEtapa 5/10: Instalando pacotes de jogos... \n"
sudo zypper install wine-staging lutris steam discord obs-studio

### Pacotes de emuladores
printf "\nEtapa 6/10: Instalando emuladores... \n"
sudo zypper install dolphin-emu pcsx2 retroarch

### Instala o GameMode da Feral Interactive
printf "\nEtapa 7/10: Instalando Feral GameMode... \n"
sudo zypper install libgamemode{auto0,auto0-32bit,0-32bit}

### Fontes TrueType da Microsoft
printf "\nEtapa 8/10: Instalando fontes TrueType da Microsoft... \n"
sudo zypper install fetchmsttfonts

### Minha seleção de pacotes
printf "\nEtapa 9/10: Instalando softwares diversos... \n"
sudo zypper install feh k{colorchooser,denlive,get,rita} p{artitionmanager,7zip-full} inkscape neofetch qbittorrent ristretto sweeper telegram-desktop unrar vokoscreenNG youtube-dl

### Altera o nome do hostname
printf "\nEtapa 10/10: Alterando o hostname para @opensuse-desktop... \n"
sudo hostnamectl set-hostname opensuse-desktop

### Fim do script.
printf "\nFIM DO SCRIPT \n\n"
