#!/bin/bash
readarray -t arr < /home/irsyad/no3/location.log
flag=0
for((n=0; n<28; n=n+1)) 
do
	nomor=$(ls -1 /home/irsyad/no3/kenangan | wc -l)
	nomor2=$(ls -1 /home/irsyad/no3/duplicate | wc -l)
	flag=$((0))
	
	for((i=0; i<$n; i=i+1)) 
		do 
		if [ $n -eq 0 ] 
			then mv /home/irsyad/no3/pdkt_kusuma_1.jpg kenangan/kenangan_1.jpg

		elif [ "${arr[$n]}" == "${arr[$i]}" ] 
		then 
			flag=$((1))
			break
		elif [ "${arr[$n]}" == "((${arr[$i]}-1))" ]
			then
			flag=$((0))
		fi
	done
	
	if [ $flag -eq 0 ] 
	then 
		mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/kenangan/kenangan_"$(($nomor+1))".jpg
	else 
		mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/duplicate/duplicate_"$(($nomor2+1))".jpg
	fi

done
