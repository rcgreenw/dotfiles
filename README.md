dotfiles
========
## Clone via HTTPS
```sh
git clone https://github.com/rcgreenw/dotfiles.git .dotfiles
cd .dotfiles
mkLinks.sh
```
## Download
```sh
curl https://codeload.github.com/rcgreenw/dotfiles/zip/master > /tmp/dotfiles-master.zip
unzip /tmp/dotfiles-master.zip -d ~
mv ~/dotfiles-master ~/.dotfiles
cd .dotfiles
mkLinks.sh
