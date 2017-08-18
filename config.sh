#! /bin/bash 

if (git diff-index --quiet --cached HEAD) ; then
	if [-e fileOld.txt]; then
		rm fileOld.txt
	fi
	mv file.txt fileOld.txt
	ls -1 >> file.txt
	diff fileOld.txt file.txt >> dif.txt 
fi

#while read line 
#do  
#   echo -e "$linen" 
#done < file.txt
