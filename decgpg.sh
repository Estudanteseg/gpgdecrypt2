# *********************************************************************************
# * Do not forget to enjoy my code in github estudentseg/feecode
# *********************************************************************************
# * Author: estudanteseg
# *********************************************************************************
# * Description: This simple program makes brute force into a gpg file 
# * using a password dictionary generating a decrypted output file.
# *********************************************************************************
# * Example: $ ./decgpg myfile.gpg myfileout.txt /usr/share/wordlists/rockyou.txt
# *********************************************************************************

#!/bin/bash

# arqin is your file .gpg, eg. myfile.gpg
arqin=$1

# arqout is your output file, eg. myfileout.txt
arqout=$2

# arqpass is your password file to break the passphrase of gpg file. eg. /usr/share/wordlists/rockyou.txt
arqpass=$3


while TRATASENHA='' read -r line || [[ -n "$line" ]]; do
    gpg -d --batch --passphrase $line -o $arqout $arqin 2>/dev/null
    if [ -e $arqout ]
    then
	echo ""
        echo "****************************************************************"	
	echo "* :D The pass $line is the correct. Congrats !!!"
	echo "* The file $arqout was successfully generated !!!"
	echo "****************************************************************"
	echo ""
	break
    else
        echo ":( Wrong pass $line It's bad !!!"	    
    fi
done < $arqpass
