# *********************************************************************************
# * Do not forget to enjoy my code in github estudentseg/feecode
# *********************************************************************************
# * Author: estudanteseg
# *********************************************************************************
# * Description: This simple program makes brute force into a gpg file 
# * using a password dictionary generating a decrypted output file.
# *********************************************************************************
# * For use this version was necessary breaking rockyou.txt in parts of 4Gb with
# * the command: split -l 4000000 -d rockyou.txt rockyoup  
# * and was generated files like rockyoup01, rockyoup02, rockyoup03,...
# *********************************************************************************
# * Example: $ ./decgpg myfile.gpg myfileout.txt /usr/share/wordlists/rockyoup01
# *********************************************************************************

#!/bin/bash

# arqin is your file .gpg, eg. myfile.gpg
arqin=$1

# arqout is your output file, eg. myfileout.txt
arqout=$2

# arqpass is your password file to break the passphrase of gpg file. eg. /usr/share/wordlists/rockyoup1.txt
arqpass=$3

# I will mount the array with the passwords
echo "I will mount the array with the passwords !!!!"
readarray -t Senhas < $arqpass     

# The array with the passwords is done !!!
echo "The array with the passwords is done !!!"

for pass in "${Senhas[@]}"
do
   echo "Trying PWD: $pass"

   gpg -d --batch --passphrase $pass -o $arqout $arqin 2>/dev/null
   if [ -e $arqout ]
   then
       echo ""
       echo "****************************************************************"	
       echo "* :D The pass "\"$pass\"" is the correct. Congrats !!!"
       echo "* The file $arqout was successfully generated !!!"
       echo "****************************************************************"
       echo ""
       break
   fi

done
