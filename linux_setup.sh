#!/bin/bash

# Configure git
git config --global user.name "FedorShatokhin2005"
git config --global user.email "groza01i@gmail.com"
git config --global credential.helper store
git config --global commit.gpgsign true
git config --global user.signingkey "688C4735813B4124"

echo 'alias regen="make ARCH=arm64 platina_defconfig; mv .config arch/arm64/configs/platina_defconfig"' >> ~/.bashrc

git clone --depth=1 https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
git clone --depth=1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
cp -v .vimrc ~/.vimrc
