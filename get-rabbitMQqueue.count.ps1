Param([string] $QueueName)
$username = "user"
$password = ConvertTo-SecureString -String "" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
$Messages = (Get-RabbitMQQueue -BaseUri http://82.200.207.108:15672/ -Credentials $Credential -Name $QueueName)
$Queue = $Messages.messages_ready + $Messages.messages_unacknowledged
Write-Host $Queue

