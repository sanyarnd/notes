# SSH configuration

## Generate keys (optional)

  ```shell script
  ssh-keygen -t ed25519 -C "email@example.com" -f $HOME/.ssh/work-github
  ```

## Edit `~/.ssh/config` file

  ```sh
  Host github.com
   HostName github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/personal-github
  
  Host work.github.com
   HostName github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/work-github
  ```

## Clone with `ssh://`, use host-alias (work) if needed

  ```sh
  git clone ssh://git@github.com/personal/repo
  git clone ssh://git@work.github.com/some-other-project/repo
  ```
