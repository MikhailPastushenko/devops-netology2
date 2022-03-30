1. _**Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.**_

type bash
Встроенная команда shell, так как меняет параметры работы в оболочке 




2. _**Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос.**_


Альтернатива - использовать ключ --сount 




3. Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?
Процесс systemd


4. Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

ls -l / > /dev/pts/1

5. Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

 cat < /etc/os-release > tempfile.txt

6..

7. Выполните команду bash 5>&1. К чему она приведет? 

Должен запуститься ещё один процесс/экземпляр оболочки, в котором файловый дескриптор 5 ассоциируется с STDOUT. 

Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?

Так как файловый дискриптор 5 ассоциирован с STDOUT, "netology" будет выведен в STDOUT

8..

9. Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?

Выводит список переменных. Аналогичный вывод можно получить командами env и printenv

10. Используя man, опишите что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe


/proc/<PID>/cmdline  строку запуска данного процесса
/proc/<PID>/exe  содержит путь к исполняемому файлу

11. Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo

Поддерживает SSE4.2

12. При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2. Однако:

vagrant@netology1:~$ ssh localhost 'tty'
not a tty

Почитайте, почему так происходит, и как изменить поведение.


Потому что в этом случае сеансу ssh не назначается псевдо-терминал. Изменить это поведение можно параметром -t 


13. Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.



14. sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.

Команда tee нужна для вывода результата любой команды в файл.