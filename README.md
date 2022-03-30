1. _**Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.**_

type bash

Встроенная команда shell, так как меняет параметры работы в оболочке 

![img_1.png](img_1.png)


2. _**Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос.**_


Альтернатива - использовать ключ --сount 

![img_2.png](img_2.png)


_**3. Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?**_


Процесс systemd

![img_3.png](img_3.png)


_**4. Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?**_


![img_15.png](img_15.png)

_**5. Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.**_

 cat < /etc/os-release > tempfile.txt

![img_5.png](img_5.png)

_**6.Получится ли вывести находясь в графическом режиме данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?**_

![img_6.png](img_6.png)

_**7. Выполните команду bash 5>&1. К чему она приведет?**_

Должен запуститься ещё один процесс/экземпляр оболочки, в котором файловый дескриптор 5 ассоциируется с STDOUT. 

_**Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?**_

Так как файловый дискриптор 5 ассоциирован с STDOUT, "netology" будет выведен в STDOUT

![img_7.png](img_7.png)

_**8.Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.**_

![img_8.png](img_8.png)

_**9. Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?**_

Выводит список переменных. Аналогичный вывод можно получить командами env и printenv


_**10. Используя man, опишите что доступно по адресам /proc/PID/cmdline, /proc/PID/exe**_


/proc/PID/cmdline  содержит строку запуска данного процесса
/proc/PID/exe  содержит путь к исполняемому файлу

![img_9.png](img_9.png)

![img_10.png](img_10.png)


_**11. Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo**_

Поддерживает SSE4.2

![img_11.png](img_11.png)

_**12. При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2. Однако: vagrant@netology1:~$ ssh localhost 'tty'
not a tty . Почитайте, почему так происходит, и как изменить поведение.**_


Потому что в этом случае сеансу ssh не назначается псевдо-терминал. Изменить это поведение можно установкой параметра -t 


_**13. Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.**_

![img_12.png](img_12.png)

![img_13.png](img_13.png)

_**14. sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.**_

Команда tee нужна для вывода результата любой команды в файл. Eё можно запустить через sudo , в отличие от стандартного перенаправления

![img_14.png](img_14.png)