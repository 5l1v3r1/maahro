#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/perl:~/root/Downloads/maahro/
alias myscript=~/root/Downloads/maahro/
cd /usr/bin
ln -fsT /root/Downloads/maahro/maahro.pl /usr/bin/maahro
chmod u+x maahro.pl
chmod u+x cleaner.sh
chmod u+x /usr/bin/maahro
echo "Installed!"
echo "Maahro can be called anywhere from system"
