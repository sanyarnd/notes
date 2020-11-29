# SSH configuration
1. Generate keys:
  ```shell script
  ssh-keygen -t ed25519 -C "email@example.com" -f $HOME/.ssh/some-id_ed25519
  ```
2. Edit (or create) `~/.ssh/config` file:
  ```
  Host github.com
   HostName github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/personal_ed25519
  
  Host some-id.github.com
   HostName github.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/some-id_ed25519
  ```
3. Clone with `ssh://` and host-alias name:
  ```shell script
  git clone ssh://git@github.com/personal/repo
  git clone ssh://git@some-id.github.com/some-other-project/repo
  ```
