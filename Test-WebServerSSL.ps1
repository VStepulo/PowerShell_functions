function Test-WebServerSSL {
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string]$URL
	)
	
    [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
    $req = [Net.HttpWebRequest]::Create($URL)
    $req.AllowAutoRedirect = $false
    try {$req.GetResponse() |Out-Null} catch {Write-Host Exception while checking URL $url`: $_ -f Red}
    $certName = $req.ServicePoint.Certificate.Subject.Split(', ',[System.StringSplitOptions]::RemoveEmptyEntries)[0].Split('=')[1]
    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
    Write-Host "CN is $certName"
    Write-Host "Thumbprint is $certThumbprint"
}

$URL = "https://wrong.host.badssl.com/"


Test-WebServerSSL $URL
