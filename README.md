
## Домашнее задание к занятию 6.6 Troubleshooting ##

### Задача 1 ###

####Пользователь (разработчик) написал в канал поддержки, что у него уже 3 минуты происходит CRUD операция в MongoDB и её нужно прервать. ####
#### Вы как инженер поддержки решили произвести данную операцию: ####
#### напишите список операций, которые вы будете производить для остановки запроса пользователя ####


С помощью db.currentOp() смотрим текущие запросы и opid

Далее с помощью db.killOp(opid) завершаем процесс.

https://www.mongodb.com/docs/manual/reference/method/db.killOp/

#### предложите вариант решения проблемы с долгими (зависающими) запросами в MongoDB ####

Можно ограничить время выполнения запросов

cursor.maxTimeMS(<time limit>)

https://www.mongodb.com/docs/manual/reference/method/cursor.maxTimeMS/

### Задача 2 ###

#### Вы запустили инстанс Redis для использования совместно с сервисом, который использует механизм TTL. Причем отношение количества записанных key-value значений к количеству истёкших значений есть величина постоянная и увеличивается пропорционально количеству реплик сервиса. ####

#### При масштабировании сервиса до N реплик вы увидели, что: ####

#### сначала рост отношения записанных значений к истекшим ####
#### Redis блокирует операции записи #### 
#### Как вы думаете, в чем может быть проблема? ####

Дословно из документации это происходит "Если в базе данных много ключей, срок действия которых истекает в одну и ту же секунду, и они составляют не менее 25% от текущей совокупности ключей с истекающим набором"

### Задача 3 ###

#### Вы подняли базу данных MySQL для использования в гис-системе. При росте количества записей, в таблицах базы, пользователи начали жаловаться на ошибки вида: ####
#### InterfaceError: (InterfaceError) 2013: Lost connection to MySQL server during query u'SELECT..... ' ####
#### Как вы думаете, почему это начало происходить и как локализовать проблему? ####

Вероятно запрос просто не успевает выполниться из-за того что таблица очень большая

#### Какие пути решения данной проблемы вы можете предложить? ####

- cоздать индексы для ускорения поиска (по условию речь идёт о запросах select …)

- оптимизировать/изменить сами запросы, если это возможно

- перейти на работу с PostgreSQL, которая лучше работает с большими объемами данных

### Задача 4 ###

#### Вы решили перевести гис-систему из задачи 3 на PostgreSQL, так как прочитали в документации, что эта СУБД работает с большим объемом данных лучше, чем MySQL. ####
#### После запуска пользователи начали жаловаться, что СУБД время от времени становится недоступной. В dmesg вы видите, что:

#### postmaster invoked oom-killer ####

#### Как вы думаете, что происходит? ####

Процесс postgresql съедает всю память и механизм oom-killer убивает его. 

####  Как бы вы решили данную проблему? #### 

Если использование большого объема памяти вызвано большим числом одновлеменных подключений, то можно например попробовать использовать pgbouncer для агрегации коннектов, увеличить размер буфера wal_buffers и поиграться с параметром max_connections.
Кроме того, общие рекомендации: увеличить объем памяти на сервере, оптимизировать запросы, создать индексы