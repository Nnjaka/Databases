/*Задача 2
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.*/

#Удаление БД, если она до этого была создана
DROP DATABASE IF EXISTS example;

#Создание БД
CREATE DATABASE example;

#Выбор БД
USE example;

#Удаление таблицы, если она до этого была создана
DROP TABLE IF EXISTS users;

#Создание таблицы
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);



/*Задача 3
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.*/

#Удаление БД, если она до этого была создана
DROP DATABASE IF EXISTS sample;

#Создание БД
CREATE DATABASE sample;

#Выходим в командную строку и создаем дамп. Перенапраляем его в файл
mysqldump -u root -p example > example.sql

#Загружаем данные в БД sample
mysql -u root -p sample < example.sql



/*Задача 4
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.*/

#Удаление БД, если она до этого была создана
DROP DATABASE IF EXISTS example2;

#Создание БД
CREATE DATABASE example2;

#Выходим в командную строку и создаем дамп. Перенапраляем его в файл
mysqldump -u root -p mysql help_keyword --where='TRUE LIMIT 100' > example2.sql

#Загружаем данные в БД sample
mysql -u root -p example2 < example2.sql
