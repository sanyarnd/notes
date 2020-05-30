# Example git SSH configuration for multiple users

tl;dr: create `~/.ssh/config` file with following context:
```
Host personal.github.com
 HostName github.com
 PreferredAuthentications publickey
 IdentityFile ~/.ssh/personal_rsa

Host <other-id>.github.com
 HostName github.com
 PreferredAuthentications publickey
 IdentityFile ~/.ssh/<oher-id>_rsa
```
and use `git clone ssh://git@<other-id>.github.com/<other-id>/<repo>` to clone repos.