#!bin/bash
mkdir /home/irsyad/no3/kenangan
mkdir /home/irsyad/no3/duplicate

> /home/irsyad/no3/wget.log
> /home/irsyad/no3/location.log

for ((n=1; n<29; n=n+1))
do
wget -a /home/irsyad/no3/wget.log "https://loremflickr.com/320/240/cat" -O /home/irsyad/no3/pdkt_kusuma_"$n".jpg
done

grep "Location" /home/irsyad/no3/wget.log > /home/irsyad/no3/location.log
