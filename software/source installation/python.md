# Build Python from source
1. Install prerequisitives and download sources:
  ```shell script
  sudo apt install --no-install-recommends -y build-essential default-libmysqlclient-dev libbz2-dev libdb-dev libffi-dev libgdbm-compat-dev libgdbm-dev liblzma-dev libmpdec-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev systemtap-sdt-dev tk-dev uuid-dev zlib1g-dev 

  wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0rc2.tar.xz
  tar -xf Python-3.9.0rc2.tar.xz
  ```
2. List default system flags
  ```shell script
  python3 -c "import sysconfig \n
    for v in sysconfig.get_config_var('CONFIG_ARGS').split("' '"): print(v)"
  ```
3. Modify `./configure` according default system flags (and add custom ones):
```shell script
  CC="x86_64-linux-gnu-gcc" CFLAGS="-g   -fstack-protector-strong -Wformat -Werror=format-security" LDFLAGS="-Wl,-Bsymbolic-functions  -Wl,-z,relro -g -fwrapv -O2   -Wl,-rpath,/opt/python/3.9/lib" CPPFLAGS="-Wdate-time -D_FORTIFY_SOURCE=2" ./configure --prefix=/opt/python/3.9 \
    --enable-loadable-sqlite-extensions \
    --enable-shared \
    --with-dbmliborder=bdb:gdbm \
    --with-computed-gotos \
    --with-lto \
    --enable-optimizations \
    --with-system-expat \
    --with-system-libmpdec \
    --with-dtrace \
    --with-system-ffi \
    --enable-ipv6 \
    --with-ensurepip=install
  ```
4. Install python
  ```shell script
  sudo make altinstall -j12
  ```
