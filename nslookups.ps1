Param(
    [Parameter(Mandatory=$false,
    ValueFromPipeline=$true)]
    [String[]]
    $passed
)

do{
$x=Read-Host "Please enter the domain to lookup - contoso.com for example"



$sip="sip."+$x
$sipex="sipexternal."+$x
$sipfed="_sipfederationtls._tcp."+$x
$siptls="_sip._tls."+$x
$sipxmpp="_xmpp-server._tcp."+$x
$access="access."+$x 
$av="av."+$x
$conf="conf."+$x
$lyncd="lyncdiscover."+$x
$meet="meet."+$x
$dial="dial-in."+$x
$autod="autodiscover."+$x



try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $x -ErrorAction Stop   } catch{write-output "Unable to resolve " $x "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $sip -ErrorAction Stop   } catch{write-output "Unable to resolve " $sip "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $sipex -ErrorAction Stop   } catch{write-output "Unable to resolve " $sipex "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $lyncd -ErrorAction Stop   } catch{write-output "Unable to resolve " $lyncd "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $sipfed -ErrorAction Stop   } catch{write-output "Unable to resolve " $sipfed "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $siptls -ErrorAction Stop   } catch{write-output "Unable to resolve " $siptls "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $sipxmpp -ErrorAction Stop   } catch{write-output "Unable to resolve " $sipxmpp "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $access -ErrorAction Stop   } catch{write-output "Unable to resolve " $access "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $conf -ErrorAction Stop   } catch{write-output "Unable to resolve " $conf "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $meet -ErrorAction Stop   } catch{write-output "Unable to resolve " $meet "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $dial -ErrorAction Stop   } catch{write-output "Unable to resolve " $dial "" }
try {   Resolve-DnsName -Server 8.8.8.8 -Type all -Name $autod -ErrorAction Stop   } catch{write-output "Unable to resolve " $autod "" }

$SiteAdress = "https://" + $lyncd + "/autodiscover/svc"
$HttpContent = Invoke-WebRequest -URI $SiteAdress
echo $httpcontent.content
echo " "
echo " "
pause
} until ( $x="")