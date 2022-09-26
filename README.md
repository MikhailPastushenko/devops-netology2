
## Домашнее задание к занятию "7.2. Облачные провайдеры и синтаксис Terraform." ##

### Задача 1. (Вариант с Yandex.Cloud). Регистрация в ЯО и знакомство с основами ###

Согласно пункту 4 чтобы не указывать авторизационный токен в коде, добавил его, а также cloudId и folderId в переменные окружения

export TF_VAR_yc_token=

export TF_VAR_yc_cloudid=

export TF_VAR_yc_folder=

и далее использовал их при описании провайдера через переменные 

token = var.yc_token

cloud_id  = var.yc_cloudid

folder_id = var.yc_folderid

###  Задача 2. Создание yandex_compute_instance через терраформ. ### 

При создании ресурса yandex_compute_instance использовал образ, созданный через Packer

Вся конфигурация в папке terraform

/+ скин 
![img.png](img.png)