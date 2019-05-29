## Запуск проекта:

Поднимаем контейнер

`docker-compose up`

Заливаем базу данных

`cat dump.sql | docker-compose exec -T docker-symfony4-mysql mysql -u root -proot forum`

Заходим в браузере

`http://127.0.0.1:8000/`

Авторизация

Логин: morty

Пароль: qwerty