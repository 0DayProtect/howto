Hashes
------



#Website used to decipher hases
#hashkiller.co.uk



#Identify a hash type
hash-identifier



#Identify hash type
hashid 2F635F6D20E3FDE0C53075A84B68FB07DCEC9B03
Analyzing '2F635F6D20E3FDE0C53075A84B68FB07DCEC9B03'
[+] SHA-1 
[+] Double SHA-1 
[+] RIPEMD-160 
[+] Haval-160 
[+] Tiger-160 
[+] HAS-160 
[+] LinkedIn 
[+] Skein-256(160) 
[+] Skein-512(160) 



#Identify hash type
$ hash-identifier 2F635F6D20E3FDE0C53075A84B68FB07DCEC9B03
   #########################################################################
   #     __  __                     __           ______    _____           #
   #    /\ \/\ \                   /\ \         /\__  _\  /\  _ `\         #
   #    \ \ \_\ \     __      ____ \ \ \___     \/_/\ \/  \ \ \/\ \        #
   #     \ \  _  \  /'__`\   / ,__\ \ \  _ `\      \ \ \   \ \ \ \ \       #
   #      \ \ \ \ \/\ \_\ \_/\__, `\ \ \ \ \ \      \_\ \__ \ \ \_\ \      #
   #       \ \_\ \_\ \___ \_\/\____/  \ \_\ \_\     /\_____\ \ \____/      #
   #        \/_/\/_/\/__/\/_/\/___/    \/_/\/_/     \/_____/  \/___/  v1.2 #
   #                                                             By Zion3R #
   #                                                    www.Blackploit.com #
   #                                                   Root@Blackploit.com #
   #########################################################################
--------------------------------------------------

Possible Hashs:
[+] SHA-1
[+] MySQL5 - SHA-1(SHA-1($pass))

#Then check in https://crackstation.net or others



#Crackhashes
hashcat -h | grep NTLM
hashcat -a0 -m 1000 2F635F6D20E3FDE0C53075A84B68FB07DCEC9B03 /usr/share/wordlists/rockyou.txt --force
hashcat (v5.1.0) starting...


#To get a hash from a decode
base64 -d <<< NmQyNDI0NzE2YzVmNTM0MDVmNTA0MDczNzM1NzMwNzI2NDIx
6d2424716c5f53405f504073735730726421



#Hexadecimal conversion
echo 6d2424716c5f53405f504073735730726421 | xxd -r -p
m$$ql_S@_P@ssW0rd!
