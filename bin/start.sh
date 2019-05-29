#!/usr/bin/env bash

pwd

cp -v .env.inst .env

php bin/console doctrine:database:drop --force

php bin/console doctrine:database:create

php bin/console doctrine:schema:create

php bin/console doctrine:fixtures:load -n

cp -v .env.prod .env
