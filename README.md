# decrypt2 gpg
# Decriptografar um arquivo que foi criptogrado com gpg utilizando chave simétrica, arquivo em memória

# Exemplo de criptografia chave simétrica:

estudante:~/Documents/estudo/crypt/gpg2$ ls

total 12K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:13 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rw-r--r-- 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh


estudante:~/Documents/estudo/crypt/gpg2$ chmod +x gpgdecrypt2.sh 


estudante:~/Documents/estudo/crypt/gpg2$ ls

total 12K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:13 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rwxr-xr-x 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh

estudante:~/Documents/estudo/crypt/gpg2$ echo "O rato roeu a roupa do Rei de Roma em Roraima." > orato.txt


estudante:~/Documents/estudo/crypt/gpg2$ ls

total 16K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:14 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rwxr-xr-x 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh

-rw-r--r-- 1 estudante estudante   47 Dec 17 06:14 orato.txt

estudante:~/Documents/estudo/crypt/gpg2$ cat orato.txt 

O rato roeu a roupa do Rei de Roma em Roraima.



estudante:~/Documents/estudo/crypt/gpg2$ gpg -c orato.txt 


# Aqui será solicitada uma senha para gerar o arquivo criptografado

estudante:~/Documents/estudo/crypt/gpg2$ ls

total 20K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:15 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rwxr-xr-x 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh

-rw-r--r-- 1 estudante estudante   47 Dec 17 06:14 orato.txt

-rw-r--r-- 1 estudante estudante  121 Dec 17 06:15 orato.txt.gpg


# Veja que foi gerado acima o arquivo orato.txt.gpg cujo conteúdo abaixo está ilegível


estudante:~/Documents/estudo/crypt/gpg2$ cat orato.txt.gpg 

�       �#01�҂���hN8

/#n9�;I�d�5�Y��G��m}����C�



# Agora vamos ao que interesssa, como rodar o decrypt2 utilizando força bruta 


# Para garantir vou apagar o arquivo original orato.txt

estudante:~/Documents/estudo/crypt/gpg2$ rm orato.txt


estudante:~/Documents/estudo/crypt/gpg2$ ls

total 16K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:15 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rwxr-xr-x 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh

-rw-r--r-- 1 estudante estudante  121 Dec 17 06:15 orato.txt.gpg


# Como rodar o programa

gpgdecrypt2.sh -> Decrypt gpg file using brute force. Eg. ./gpgdecrypt2 orato.txt.gpg orato2.txt /usr/share/wordlists/rockyoup01

# Exemplo (parte1), listando os arquivos rockyoup01, rockyoup02,
estudante:~/Documents/estudo/crypt/gpg2$ ls -lah /usr/share/wordlists/rockyoup0*

-rw-r--r-- 1 root root 36M Dec 17 06:00 /usr/share/wordlists/rockyoup00

-rw-r--r-- 1 root root 39M Dec 17 06:00 /usr/share/wordlists/rockyoup01

-rw-r--r-- 1 root root 38M Dec 17 06:00 /usr/share/wordlists/rockyoup02

-rw-r--r-- 1 root root 22M Dec 17 06:00 /usr/share/wordlists/rockyoup03



# Exemplo (parte2), rodando e aguardando até encontrar a senha

estudante:~/Documents/estudo/crypt/gpg2$ ./gpgdecrypt2.sh orato.txt.gpg orato2.txt /usr/share/wordlists/rockyoup00

I will mount the array with the passwords !!!!

The array with the passwords is done !!!

Trying PWD: 123456

Trying PWD: 12345

Trying PWD: 123456789

Trying PWD: password

Trying PWD: iloveyou

Trying PWD: princess

:::::

:::::

:::::

(aguarde até o final do processamento)

# Exemplo (parte3), senha encontrada


Trying PWD: 0123456789

Trying PWD: school

Trying PWD: barcelona

****************************************************************

* :D The pass "barcelona" is the correct. Congrats !!!

* The file orato2.txt was successfully generated !!!

****************************************************************


estudante:~/Documents/estudo/crypt/gpg2$ ls

total 20K

drwxr-xr-x 2 estudante estudante 4.0K Dec 17 06:33 .

drwxr-xr-x 4 estudante estudante 4.0K Dec 17 06:07 ..

-rwxr-xr-x 1 estudante estudante 2.0K Dec 17 06:13 gpgdecrypt2.sh

-rw-r--r-- 1 estudante estudante   47 Dec 17 06:33 orato2.txt

-rw-r--r-- 1 estudante estudante  121 Dec 17 06:15 orato.txt.gpg


# Exemplo (parte4), conferindo o arquivo gerado

estudante:~/Documents/estudo/crypt/gpg2$ cat orato2.txt 

O rato roeu a roupa do Rei de Roma em Roraima.
