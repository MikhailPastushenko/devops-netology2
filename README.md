# Задание Инструменты Git

_**1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea**_

git show aefea

Полный хэш aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Комментарий Update CHANGELOG.md

_**2.Какому тегу соответствует коммит 85024d3?**_

git show 85024d3

tag: v0.12.23


**_3. Сколько родителей у коммита b8d720? Напишите их хеши_**

git show b8d720^

1 родитель, хэш 56cd7859e05c36c06b56d013b55a252d0bb7e158


**_4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24._**

git log --oneline v0.12.23..v0.12.24

33ff1c03b (tag: v0.12.24) v0.12.24

b14b74c49 [Website] vmc provider links

3f235065b Update CHANGELOG.md

6ae64e247 registry: Fix panic when server is unreachable

5c619ca1b website: Remove links to the getting started guide's old location

06275647e Update CHANGELOG.md

d5f9411f5 command: Fix bug when using terraform login on Windows

4b6d06cc5 Update CHANGELOG.md

dd01a3507 Update CHANGELOG.md

225466bc3 Cleanup after v0.12.23 release

_**5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).**_

git grep 'providerSource('  - находим, что функция описана в файле provider_source.go

git log -L:providerSource:provider_source.go --pretty=short

commit 8c928e83589d90a031f811fae52a81be7153e82f     main: Consult local directories as potential mirrors of providers


_**6. Найдите все коммиты в которых была изменена функция globalPluginDirs**_

git grep globalPluginDirs - находим, что функция описана в файле plugins.go

git log -L:globalPluginDirs:plugins.go

commit 78b12205587fe839f10d946ea3fdc06719decb05

commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46

commit 41ab0aef7a0fe030e84018973a64135b11abcd70

commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17

commit 8364383c359a6b738a436d1b7745ccdce178df47 - создана в данном коммите

**_7. Кто автор функции synchronizedWriters?_**

git log -SsynchronizedWriters --pretty=short

Author: Martin Atkins <mart@degeneration.co.uk>