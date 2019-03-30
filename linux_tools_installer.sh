#!/bin/sh
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

pkg_array=(
                gcc
                Make
                Perl
                Acl
                Attr
                Autoconf
                Automake
                Bash
                Bc
                Binutils
                Bison
                Bzip2
                Check
                Coreutils
                DejaGNU
                Diffutils
                Eudev
                E2fsprogs
                Expat
                Expect
                File
                Findutils
                Flex
                Gawk
                GDBM
                Gettext
                Glibc
                GMP
                Gperf
                Grep
                Groff
                GRUB
                Gzip
                Iana-Etc
                Inetutils
                Intltool
                IPRoute2
                Kbd
                Kmod
                Less
                Libcap
                Libpipeline
                Libtool
                M4
                Man-DB
                Man-pages
                MPC
                MPFR
                Ncurses
                Patch
                Pkg-config
                Procps
                Psmisc
                Readline
                Sed
                Shadow
                Sysklogd
                Sysvinit
                Tar
                Tcl
                Texinfo
                tzdata
                Udev-lfs
                Tarball
                Util-linux
                Vim
                libxml-parser-perl
                Xz-utils
                Zlib
          )

apt update

for i in "${pkg_array[@]}";
    do
        dpkg -s $i &> /dev/null
        if [ $? -eq 0 ]; then
            echo "$i ${CYAN}Package is installed!${NC}"
        else
            echo "installing $i";
            apt install $i -y || echo "$i ${RED}Installation failed${NC}" && exit
            echo "$i ${GREEN}installation success !${NC}"
        fi
done
