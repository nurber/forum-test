## Запуск проекта:
Поднимаем контейнер

`docker-compose up`

Создаем базу данных

`php bin/console doctrine:database:create`

`php bin/console doctrine:schema:create`

Загрузка фикстур:

`php bin/console doctrine:fixtures:load`

Заходим в браузере

`http://127.0.0.1:8000/`

Авторизация

Логин: morty

Пароль: qwerty