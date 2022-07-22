
## Домашнее задание к занятию 6.2 SQL ##

### Задача 1 ###

#### Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, в который будут складываться данные БД и бэкапы. Приведите получившуюся команду или docker-compose манифест. ####

![img_2.png](img_2.png)

### Задача 2 ###

#### создайте пользователя test-admin-user и БД test_db ####

![img_3.png](img_3.png)

#### в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже) ####

![img_4.png](img_4.png)

#### предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db ####
#### создайте пользователя test-simple-user ####
#### предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db #### 

![img_5.png](img_5.png)

#### итоговый список БД после выполнения пунктов выше ####

![img_6.png](img_6.png)

#### SQL-запрос для выдачи списка пользователей с правами над таблицами test_db ####

![img_7.png](img_7.png)

### Задача 3 ###

#### Используя SQL синтаксис - наполните таблицы следующими тестовыми данными: ####

![img_8.png](img_8.png)

![img_9.png](img_9.png)

#### вычислите количество записей для каждой таблицы ####

![img_10.png](img_10.png)

### Задача 4 ###

#### Часть пользователей из таблицы clients решили оформить заказы из таблицы orders. ####
#### Используя foreign keys свяжите записи из таблиц, согласно таблице: ####

![img_11.png](img_11.png)

![img_12.png](img_12.png)

#### Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса. ####

![img_13.png](img_13.png)

### Задача 5 ###

#### Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 (используя директиву EXPLAIN). ####
#### Приведите получившийся результат и объясните что значат полученные значения ####

![img_14.png](img_14.png)

0.00 - время необходимое для того чтобы начать выводить данные

1.04 - ожидаемое время полного вывода данных

Rows=4 - ожидаемое число выводимых строк

Width=164 - ожидаемый средний размер строк

### Задача 6 ###

#### Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. Задачу 1). ####

![img_15.png](img_15.png)

#### Поднимите новый пустой контейнер с PostgreSQL. ####

![img_16.png](img_16.png)

#### Восстановите БД test_db в новом контейнере. ####

![img_17.png](img_17.png)