# gitlab-ci
## Установка Gitlab на Ubuntu
1. Установить зависимости
```
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates postfix
```
2. Добавить репозиторий
```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
```
3. Выполнить установку с указанием адреса gitlab
```
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee
```
4. Открыть в браузере адрес указанный в п.3 и авторизоваться под пользователем `root`

## Установка GitLab Runner
1. Скачивем последнюю версию в виде бинарника
```
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
```
2. Делаем его исполняемым
```
sudo chmod +x /usr/local/bin/gitlab-runner
```
3. Создаем нового пользователя
```
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
```
4. Устанавливаем и запускаем сервис
```
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start
```

## Подключение Runner к Gitlab
1. Запускаем настройку подключения
```
sudo gitlab-runner register
```
2. Вводим gitlab url, токен доступа, описание, тэги, среду запуска и docker-образ по умолчанию