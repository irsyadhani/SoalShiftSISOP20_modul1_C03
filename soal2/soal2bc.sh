#!/bin/bash

file=$1
jam=$(date +%H)


for ((i=1;i<=jam;i++)) 
do
        file=$(echo "$file" | tr '[a-zA-Z]' '[b-zaB-ZA]')
done
