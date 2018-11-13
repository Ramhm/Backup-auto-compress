#!/bin/bash
## R.HAKIMI

SRCDIR="/tmp"
DATE=$(date +%Y%m%d-%H%M%S)


while true
do

	find $SRCDIR -type f -name "*.bak" -print > Filelist.log
	echo "DONE." >> Filelist.log
	FILE=$(head -n1 Filelist.log)
        echo $DATE URL:$FILE > File_Name.log

	if [ "$FILE" == "DONE." ];then
        echo $DATE "Empty File" > Start_End.log
        exit 1
else
        tar -I pigz -cf $FILE.tgz -P $FILE
	echo $DATE "Compress File" >> Start_End.log
        rm -rf $FILE
fi
done
