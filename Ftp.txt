Ftp
---

#Useful ftp commands to run in Linux


#Log into a host as anonymous user
[username@host ~]$ ftp x.x.x.x
Connected to x.x.x.x.
220 Microsoft FTP Service
Name (x.x.x.x:host): anonymous
331 Anonymous access allowed, send identity (e-mail name) as password.
Password: 
230 User logged in.
Remote system type is Windows_NT.



#Download File
ftp> get iisstart.htm
200 PORT command successful.
125 Data connection already open; Transfer starting.
226 Transfer complete.
689 bytes received in 0.488 seconds (1.38 kbytes/s)


#Upload file
ftp> put devel1.aspx
200 PORT command successful.
125 Data connection already open; Transfer starting.
226 Transfer complete.
2844 bytes sent in 0.000375 seconds (7.23 Mbytes/s)



#List directory structure
ftp> dir
200 PORT command successful.
125 Data connection already open; Transfer starting.
03-18-17  01:06AM       <DIR>          aspnet_client
10-30-19  06:31AM                 2844 devel1.aspx
03-17-17  04:37PM                  689 iisstart.htm
10-30-19  06:25AM                    0 test.html
03-17-17  04:37PM               184946 welcome.png
226 Transfer complete.

