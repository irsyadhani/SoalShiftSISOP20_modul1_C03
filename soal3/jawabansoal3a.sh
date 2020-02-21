#!/bin/bash
a=1

while [ $a -lt 29 ]
do
echo $a
wget -O pdkt_kusuma_$a.jpg "https://loremflickr.com/320/240/cat"
  a=$((a + 1))
done
