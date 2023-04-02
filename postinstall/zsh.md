# ZSH

## Oh My Posh

```sh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
```

## Configure Zim

```sh
sudo apt install -y zsh git
sudo chsh -s /bin/zsh
zsh

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# enable oh my posh promt with Powerlevel10k theme
sed -i '1 i\eval "$(oh-my-posh init zsh --config ~/.poshthemes/powerlevel10k_lean.omp.json)"' .zshrc

# find and replace zsh-users/zsh-syntax-highlighting with zdharma-continuum/fast-syntax-highlighting
sed -i '/^zmodule zsh-users\/zsh-syntax-highlighting/a zmodule zdharma-continuum\/fast-syntax-highlighting' .zimrc
sed -i '/^zmodule zsh-users\/zsh-syntax-highlighting/s/^/# /' .zimrc
```
