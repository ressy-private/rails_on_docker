#!/bin/bash

USER=rails

# rbenvのインストール
INSTALL_RBENV=$(cat <<'EOS'
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo "export PATH=~/.rbenv/shims:~/.rbenv/bin:$PATH" >> ~/.bash_profile
echo "eval \"\$(rbenv init -)\"" >> ~/.bash_profile
echo "cd ~" >> ~/.bash_profile
source ~/.bash_profile
EOS
)
su -l "${USER}" -c "${INSTALL_RBENV}"

# ruby-buildのインストール
/home/"${USER}"/.rbenv/plugins/ruby-build/install.sh

# rubyのインストール
INSTALL_RUBY=$(cat <<'EOS'
rbenv install 2.4.1
rbenv global 2.4.1
gem install bundler
EOS
)
su -l "${USER}" -c "${INSTALL_RUBY}"
