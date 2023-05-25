$username = "user"
$password = ConvertTo-SecureString -String "" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
$ListQueue = Get-RabbitMQQueue -BaseUri http://82.200.207.108:15672/ -Credentials $Credential
#$QueueName = 'paas'
#$Queue = (Get-RabbitMQQueue -BaseUri http://82.200.207.108:15672/ -Credentials $Credential -Name $QueueName).Messages
#Write-Host $Queue





$Queue = $ListQueue | Select-Object @{N='{#QUEUENAME}'; E={$_.Name}}
$json = convertto-json $Queue

write-host "{"

write-host " `"data`":$json"

write-host "}"

write-host