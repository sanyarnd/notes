# WSL tweaks

General info available at <https://learn.microsoft.com/en-us/windows/wsl/wsl-config>.

`.wslconfig`:

```ini
[wsl2]
memory=16GB 
processors=8
swap=4GB
```

`/etc/wsl.conf`:

```ini
[interop]
enabled = false
appendWindowsPath = false
```

## Remote Development (ssh)

You can run SSH for tools that support remote development, but no native WSL integration.

```shell script
sudo dpkg-reconfigure openssh-server
sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/#PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service ssh start
```
