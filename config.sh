#! /bin/bash 

rm fileOld.txt
mv file.txt fileOld.txt 
if (git diff-index --quiet --cached HEAD) ; then
	ls -1 >> file.txt
	diff fileOld.txt file.txt >> dif.txt 
fi


#while read line 
#do  
#   echo -e "$linen" 
#done < file.txt
