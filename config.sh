#! /bin/bash 
#Verifica se houve alteracão no repositório
if !(git status --porcelain);then
    echo "IT IS CLEAN"
    ls -1 >> file.txt 
else
	#caso haja verifica se o fileOld existe, se existe deleta	
	file="fileOld.txt"
	if [ -f "$file" ]; then
		echo "FileOld"
		rm fileOld.txt
	fi
	#Verifica se existe o arquivo dif.txt, se existir deleta
	file="dif.txt"
	if [ -f "$file" ]; then
		echo "Diff"
		rm dif.txt
	fi
	#modifica o nome do arquivo file, para fileOld
	mv file.txt fileOld.txt
	#guarda as novas informacões no file
	ls -1 >> file.txt
	#Verifica as diferenćas entre file e fileOld 
	diff file.txt fileOld.txt  >> dif.txt
	#Deleta informacões desnecessárias do arquivo dif 
	sed -i 's/> //g' dif.txt
	sed -i '/^file/d' dif.txt
	sed -i '/^dif/d' dif.txt
	sed -i '/^[[:digit:]]/d' dif.txt
	sed -i '/^$/d' dif.txt
	#Adiciona as modificacões ao repositório
	git add -A 
	git commit -m "$(date -R)"
	git push -u origin master 
	
	while read linha 
	do
	link="https://raw.githubusercontent.com/silmjr/WRF_FILES/master/"
	link=$link$linha 
		#Insert aqui... 
		echo $linha
		echo $link 
	done < dif.txt
fi


