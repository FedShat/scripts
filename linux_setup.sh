#!/bin/bash

# Configure git
git config --global user.name "FedorShatokhin2005"
git config --global user.email "groza01i@gmail.com"
git config --global credential.helper store
git config --global commit.gpgsign true
git config --global user.signingkey "688C4735813B4124"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i "s#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel10k/powerlevel10k"#g" ~/.zshrc

git clone https://github.com/FedorShatokhin2005/aliases ~/.aliases
echo "source ~/.aliases/aliases" >> ~/.zshrc

git clone --depth=1 https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
git clone --depth=1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
cp -v .vimrc ~/.vimrc
