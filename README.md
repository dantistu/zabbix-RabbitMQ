# zabbix-RabbitMQ
Мониторитнг осушествляется по средством темплейта LLD "RabbitMQqueue descovery" сценарии запускаются с хоста dev1c.itsheff.cloud не него же и добавлен данный темплейт
## zabbix_agentd.conf
- Timeout=30
- UnsafeUserParameters=1
- UserParameter=queue.name[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\get-rabbitMQqueue.ps1"
- UserParameter=get.massage.count[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\get-rabbitMQqueue.count.ps1" "$1"
## Настройки на хосте
Необходимо положить два этих powershell сценария на хост с которого хотим мониторить очереди в папку C:\zabbix и добавить строки конфиг
- get-rabbitMQqueue.ps1
- get-rabbitMQqueue.count.ps

## Настройки на сервере zabbix
- Добавляем template RabbitMQqueue descovery
- Применяем tempalte  RabbitMQqueue descovery к нужному хосту
- Идем в latest data этого хоста проверяем пошла ли инфа нашлись ли очереди
