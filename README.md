dotfiles
========
## Clone via HTTPS
```sh
cd ~
git clone https://github.com/rcgreenw/dotfiles.git .dotfiles
~/.dotfiles/mkLinks.sh
```
## Download
```sh
curl https://codeload.github.com/rcgreenw/dotfiles/zip/master > /tmp/dotfiles-master.zip
unzip /tmp/dotfiles-master.zip -d ~
mv ~/dotfiles-master ~/.dotfiles
~/.dotfiles/mkLinks.sh
