#!/bin/bash

hostname=`hostname`
cputype=`prtdiag|sed -n -e 8p`
declare -i cpucores=`psrinfo|wc -l`

declare -i pagesize=`pagesize`
declare -i physpages=`kstat -p unix:0:system_pages:pagestotal | awk '{print $2}'`
declare -i totalmemorymb=$physpages*$pagesize/1024/1024

echo "
                          _
 ___ _ __ ___   __ _ _ __| |_ ___  ___   Hostname: $hostname
/ __| '_ \` _ \ / _\` | '__| __/ _ \/ __|  CPU: $cputype
\__ \ | | | | | (_| | |  | || (_) \__ \  Cores: $cpucores
|___/_| |_| |_|\__,_|_|   \__\___/|___/  Memory: $totalmemorymb MB

" >> /etc/motd

