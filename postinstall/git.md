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
  
  Host some-id.github.com
   HostName github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/work-github
  ```

## Clone with `ssh://`, use host-alias (some-id) if needed

  ```sh
  git clone ssh://git@github.com/personal/repo
  git clone ssh://git@some-id.github.com/some-other-project/repo
  ```
