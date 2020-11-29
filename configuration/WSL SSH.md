# Enable SSH
```shell script
sudo dpkg-reconfigure openssh-server
sudo sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/#PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service ssh start
```