# Prezto
tl;dr:
```shell script
sudo apt install -y zsh git

zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

sudo sed -i "s/theme 'sorin'/theme powerlevel10k/g" ~/.zpreztorc
```

1. Install `Prezto`: https://github.com/sorin-ionescu/prezto#installation
2. (Optional) Install fonts: https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k
3. Change theme in `~/.zpreztorc`:
  ```shell script
  # replace
  zstyle ':prezto:module:prompt' theme 'sorin'
  # with
  zstyle :prezto:module:prompt theme powerlevel10k
  ```
