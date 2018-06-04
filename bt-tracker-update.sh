#!/usr/bin/env bash
cfg="$1"
service aria2 stop
list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" ${cfg}`" ]; then
    sed -i '$a bt-tracker='${list} ${cfg}
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" ${cfg}
    echo update......
fi
service aria2 start
