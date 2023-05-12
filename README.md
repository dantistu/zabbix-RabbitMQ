# zabbix-RabbitMQ
Мониторитнг осушествляется по средством темплейта LLD "RabbitMQqueue descovery" сценарии запускаются с хоста dev1c.itsheff.cloud не него же и добавлен данный темплейт
# zabbix_agentd.conf
- Timeout=30
- UnsafeUserParameters=1
- UserParameter=queue.name[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\get-rabbitMQqueue.ps1"
- UserParameter=get.massage.count[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\get-rabbitMQqueue.count.ps1" "$1"
