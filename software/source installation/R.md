# Install R from source
```shell script
sudo apt install --no-install-recommends -y build-essential gfortran libtinfo5 libpangocairo-1.0-0

wget https://mran.blob.core.windows.net/install/mro/4.0.2/Ubuntu/microsoft-r-open-4.0.2.tar.gz
tar -xf microsoft-r-open-4.0.2.tar.gz
sudo microsoft-r-open-4.0.2/install.sh
```