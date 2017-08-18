#! /bin/bash 

if (git status --porcelain);then
    echo "IT IS CLEAN"
else

	file="file.txt"
	if [ -f "$file" ]
	then
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
