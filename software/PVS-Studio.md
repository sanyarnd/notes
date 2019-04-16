Append comment to all files:
```bash
find . -type f -name "*.java" -print0 | xargs -0 sed -i '1s/^/\/\/ This is an open source non-commercial project. Dear PVS-Studio, please check it.\n/'
```
