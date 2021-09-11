/*Задание 1
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/

-- Заполняем таблицу orders
INSERT INTO orders (user_id)
VALUES 
  (1),
  (2),
  (3);
  
-- Заполняем таблицу orders_products
INSERT INTO orders_products (order_id,	product_id,	total)
VALUES 
  (1, 1, 1),
  (1, 2, 2),
  (2, 3, 1),
  (3, 4, 3),
  (3, 5, 1),
  (3, 6, 1);
  
 -- Формируем запрос
SELECT 
  users.id, 
  users.name
FROM users
  JOIN orders
    ON users.id = orders.user_id;


/*Задание 2
Выведите список товаров products и разделов catalogs, который соответствует товару.*/
   
-- Если задание не связано с предыщущим и требовалось вывести общий список товаров и их категорий:
SELECT 
  products.name, 
  catalogs.name
FROM products
  LEFT JOIN catalogs
    ON products.catalog_id = catalogs.id;  

-- Если в задании требовалось вывести список товаров и их категорий относительно пользователей, которые сделали заказ (предыдущее задание)
SELECT 
  products.name, 
  catalogs.name
FROM orders_products
  LEFT JOIN products
    ON orders_products.product_id = products.id  
  LEFT JOIN catalogs
    ON products.catalog_id = catalogs.id;  
   

/*Здание 3
(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/
   
-- Удаление БД, если она до этого была создана
DROP DATABASE IF EXISTS flying;

-- Создание БД
CREATE DATABASE flying;

-- Выбор БД
USE flying;

-- Удаление таблицы рейсов, если она до этого была создана
DROP TABLE IF EXISTS flights;

-- Создание таблицы рейсов
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255),
  `to` VARCHAR(255)
);   
   
-- Удаление таблицы городов, если она до этого была создана
DROP TABLE IF EXISTS cities;

-- Создание таблицы городов
CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255)
);     
   
-- Заполняем таблицы данными
INSERT INTO flights
VALUES 
  (1, 'moscow', 'omsk'),
  (2, 'novgorod', 'kazan'),
  (3, 'irkutsk', 'moscow'),
  (4, 'omsk', 'irkutsk'),
  (5, 'moscow', 'kazan');   
   
INSERT INTO cities
VALUES 
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск'); 
   
 -- Формируем запрос через вложенные запросы
 SELECT 
  flights.id, 
  (SELECT cities.name FROM cities WHERE flights.`from` = cities.label) AS `from`,
  (SELECT cities.name FROM cities WHERE flights.`to` = cities.label) AS `to`
FROM flights 
ORDER BY flights.id;
   
   
   
   
   
   
   
 