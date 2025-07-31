#!/bin/bash

sudo apt update
# パッケージの更新
sudo apt upgrade
sudo apt dist-upgrade
# 基本設定
sudo apt install -y git curl openssh-client wget software-properties-common apt-transport-https gpg ca-certificates
# 言語系
## c/c++開発用パッケージ
sudo apt install build-essential gdb
## ruby開発用パッケージ
### 必要ライブラリのインストール
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev libyaml-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev
sudo apt install -y nodejs npm
### rbenvのインストール
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
### rbenvのパス通し
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
### rubyビルドパッケージ
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
### rbenvへのrubyインストール
rbenv install 3.3.0 # インストールしたいRubyのバージョンを指定
rbenv global 3.3.0 # デフォルトで使用するバージョンを設定
ruby -v # バージョンを確認


## ショートカット系
# keyd
cd ~
git clone https://github.com/rvaiya/keyd.git
cd keyd
make
sudo make install
sudo systemctl enable keyd
sudo systemctl start keyd

# touchpadジェスチャー
## 保留

# androidタブレットのサブディスプレイ化
## 保留

# 電源管理
sudo apt install tlp

# docker engine
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# デスクトップアプリ
## vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

