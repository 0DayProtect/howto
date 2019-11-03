Scanning
--------

Network enumeration is when usernames or info on groups, shares, and services of a networked computers are retrieved. 
Network mapping, only retrieves information about which servers are connected to a specific network and host discovery (Operating System)



#Scan all ports on a host
masscan -e tun0 x.x.x.x -p1-65535 --rate=1000

Starting masscan 1.0.4 (http://bit.ly/14GZzcT) at 2019-10-27 15:44:27 GMT
-- forced options: -sS -Pn -n --randomize-hosts -v --send-eth
Initiating SYN Stealth Scan
Scanning 1 hosts [65535 ports/host]
Discovered open port 80/tcp on x.x.x.x
Discovered open port 49154/tcp on x.x.x.x
Discovered open port 135/tcp on x.x.x.x
rate:  0.00-kpps, 100.00% done, waiting 9-secs, found=3           
rate:  0.00-kpps, 100.00% done, waiting 8-secs, found=3



#Scanning for open ports, Services and Host discovery
nmap -sS -Pn -A x.x.x.x
nmap -sC -sS -sV -F x.x.x.x

Nmap scan report for x.x.x.x
Host is up (0.41s latency).
Not shown: 98 filtered ports
PORT   STATE SERVICE VERSION
21/tcp open  ftp     Microsoft ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
| 03-18-17  01:06AM       <DIR>          aspnet_client
| 03-17-17  04:37PM                  689 iisstart.htm
|_03-17-17  04:37PM               184946 welcome.png
| ftp-syst: 
|_  SYST: Windows_NT
80/tcp open  http    Microsoft IIS httpd 7.5
| http-methods: 
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/7.5
|_http-title: IIS7
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 32.07 seconds



#Search a specific port for vulnerability
nmap --script vuln -p445 x.x.x.x


PORT    STATE SERVICE
445/tcp open  microsoft-ds
|_clamav-exec: ERROR: Script execution failed (use -d to debug)

Host script results:
|_smb-vuln-ms10-054: false
|_smb-vuln-ms10-061: NT_STATUS_OBJECT_NAME_NOT_FOUND
| smb-vuln-ms17-010: 
|   VULNERABLE:
|   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
|     State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
|           
|     Disclosure date: 2017-03-14
|     References:
|       https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
|_      https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/



#Download web framework version/information
#curl x.x.x.x/CHANGELOG.txt



#Scan webframework
nmap -sC -sV x.x.x.x -oA hostname
Nmap scan report for x.x.x.x
Host is up (0.086s latency).
Not shown: 997 filtered ports
PORT      STATE SERVICE VERSION
80/tcp    open  http    Microsoft IIS httpd 7.5
|_http-generator: Drupal 7 (http://drupal.org)
| http-methods: 
|_  Potentially risky methods: TRACE
| http-robots.txt: 36 disallowed entries (15 shown)
| /includes/ /misc/ /modules/ /profiles/ /scripts/ 
| /themes/ /CHANGELOG.txt /cron.php /INSTALL.mysql.txt 
| /INSTALL.pgsql.txt /INSTALL.sqlite.txt /install.php /INSTALL.txt 
|_/LICENSE.txt /MAINTAINERS.txt
|_http-server-header: Microsoft-IIS/7.5
|_http-title: Welcome to 10.10.10.9 | 10.10.10.9
135/tcp   open  msrpc   Microsoft Windows RPC
49154/tcp open  msrpc   Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 74.74 seconds



#LFI (Local file Include) Scan
fimap -H -d 3 -u http://x.x.x.x -w /tmp/fimap_output

fimap v.1.00_svn (My life for Aiur)
:: Automatic LFI/RFI scanner and exploiter
:: by Iman Karim (fimap.dev@gmail.com)

Crawler is harvesting URLs from start URL: 'http://x.x.x.x' with depth: 3 and writing results to: '/tmp/fimap_output'
[0] Going to root URL: 'http://10.10.10.8'...
[Done: 0 | Todo: 2 | Depth: 1] Going for next URL: 'http://x.x.x.x/'...
[Done: 1 | Todo: 1 | Depth: 1] Going for next URL: 'http://x.x.x.x/?tpl=list&folders-filter=%5c&recursive'...
Harvesting done.



#Scan for vulnerabilities
nikto -h http://x.x.x.x

- Nikto v2.1.6
---------------------------------------------------------------------------
+ Target IP:          x.x.x.x
+ Target Hostname:    x.x.x.x
+ Target Port:        80
+ Start Time:         2019-10-26 22:28:25 (GMT0)
---------------------------------------------------------------------------
+ Server: HFS 2.3
+ The anti-clickjacking X-Frame-Options header is not present.
+ The X-XSS-Protection header is not defined. This header can hint to the user agent to protect against some forms of XSS
+ The X-Content-Type-Options header is not set. This could allow the user agent to render the content of the site in a different fashion to the MIME type
+ Cookie HFS_SID created without the httponly flag



#Page and Directory Brueforcing
/usr/bin/dirsearch -u x.x.x.x -e txt,html,php

 _|. _ _  _  _  _ _|_    v0.3.8
(_||| _) (/_(_|| (_| )

Extensions: txt, html, php | HTTP method: get | Threads: 10 | Wordlist size: 6715

Error Log: /home/RedTeam/.dirsearch/logs/errors-19-10-26_22-31-53.log

Target: x.x.x.x

[22:31:54] Starting: 
[22:36:59] 200 -  576B  - /favicon.ico                                          
                                                                                
Task Completed



#Run a Dictonary attack against a webframework
dirb http://x.x.x.x/ /home/RedTeam/.ZAP/fuzzers/dirbuster/directory-list-2.3-big.txt



#Locate directories on a webframework
dirbuster -l /home/RedTeam/.ZAP/fuzzers/dirbuster/directory-list-2.3-big.txt -u http://x.x.x.x
Starting OWASP DirBuster 1.0-RC1
Starting dir/file list based brute forcing
Dir found: / - 200
Dir found: /search/ - 403
Dir found: /.git/ - 403


