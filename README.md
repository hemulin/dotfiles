_Based on the lovely codebase by_ [legion0](https://github.com/legion0/dotfiles)

Setup Instructions:


cd /tmp

git clone https://github.com/hemulin/dotfiles.git

cp -r dotfiles/.git ~/

cd ~

git checkout .

rm -rf /tmp/dotfiles

rm -rf .git

source .bashrc
