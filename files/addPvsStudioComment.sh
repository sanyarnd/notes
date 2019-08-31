!#/bin/sh

find . -type f -name "*.cs" -print0 | xargs -0 \
    sed -i '1s/^/\/\/ This is an open source non-commercial project. Dear PVS-Studio, please check it.\n\/\/ PVS-Studio Static Code Analyzer for C, C++, C#, and Java: http:\/\/www.viva64.com\n/'
