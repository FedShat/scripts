#!/bin/bash

# Installing packages

sudo apt update
sudo apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-7-aarch64-linux-gnu libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip bc ccache git imagemagick lib32readline-dev lib32z1-dev liblz4-tool pngquant libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 lzop pngcrush rsync schedtool squashfs-tools openjdk-8-jdk p7zip-full meld brotli qt4-qmake qt5-qmake android-tools-adb android-tools-fastboot python-networkx python-pip texinfo maven swapspace libncurses5 zsh python3-pip vim

# Configure git
git config --global user.name "FedorShatokhin2005"
git config --global user.email "groza01i@gmail.com"
git config --global credential.helper store
git config --global commit.gpgsign true
git config --global user.signingkey "688C4735813B4124"

# Installing oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# sed -i "s#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel10k/powerlevel10k"#g" ~/.zshrc
echo 'alias regen="make ARCH=arm64 platina_defconfig; mv .config arch/arm64/configs/platina_defconfig"' >> ~/.bashrc

# Clone kernel build dependencies
mkdir ~/build
git clone https://github.com/AlpacaGang/Publishbot ~/build/PublishBot
git clone https://github.com/arter97/arm64-gcc.git --depth=1 ~/build/tools/arm64-gcc
git clone https://github.com/AlpacaGang/AnyKernel3.git -b master ~/build/AK3
pip3 install -r ~/build/PublishBot/requirements.txt

# Clone gruvbox theme
git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox

# Copy vimrc
# Thanks @liferooter
cp -v .vimrc ~/.vimrc

