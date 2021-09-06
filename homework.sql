/*Операторы, фильтрация, сортировка и ограничение*/

/*Задание 1
 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем*/

-- Обновляем поля created_at и updated_at и заполняем текущими датой и временем
UPDATE users 
SET created_at = NOW(), updated_at = NOW();


/*Задание 2
Таблица users была неудачно спроектирована. Записи created_at и udated_at были заданы типом VARCHAR и в них 
долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
сохранив введеные ранее значения.*/
-- Преобразовываем поля к типу VARCHAR
ALTER TABLE users MODIFY COLUMN created_at VARCHAR(128);
ALTER TABLE users MODIFY COLUMN updated_at VARCHAR(128);

-- Обновляем поля created_at и updated_at и заполняем их датой "20.10.2017 8:10"
UPDATE users 
SET created_at = '20.10.2017 8:10', updated_at = '20.10.2017 8:10';

-- Добавляем новые колонки created_at_new и updated_at_new с типом данных DATATIME
ALTER TABLE users ADD COLUMN created_at_new DATETIME;
ALTER TABLE users ADD COLUMN updated_at_new DATETIME;

-- Заполняем колонки created_at_new и updated_at_new 
UPDATE users SET created_at_new = CONCAT(SUBSTR(created_at, 7, 4), '-', SUBSTR(created_at, 4, 2), '-', 
  SUBSTR(created_at, 1, 2), ' ', SUBSTR(created_at, 12, 1), ':', SUBSTR(created_at, 14, 2), ':00');  
  
UPDATE users SET updated_at_new = CONCAT(SUBSTR(updated_at, 7, 4), '-', SUBSTR(updated_at, 4, 2), '-', 
  SUBSTR(updated_at, 1, 2), ' ', SUBSTR(updated_at, 12, 1), ':', SUBSTR(updated_at, 14, 2), ':00');   
  
-- Удаляем колонки created_at и updated_at
ALTER TABLE users DROP created_at;
ALTER TABLE users DROP updated_at;
 
-- Переименовываем created_at_new и updated_at_new в created_at и updated_at, соответственно
ALTER TABLE users RENAME COLUMN created_at_new TO created_at;
ALTER TABLE users RENAME COLUMN updated_at_new TO updated_at;


 /*Задание 3
 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар 
 закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
 чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, 
 после всех записей.*/
 -- Заполняем поле vslue таблицы storehouses_products
 INSERT INTO storehouses_products (value) 
   VALUES (0), (2500), (0), (30), (500), (1);
  
-- Сортируем записи
SELECT value 
FROM storehouses_products
ORDER BY value = 0, value;



/*Агрегация данных*/

/*Задание 1
 Подсчитайте средний возраст пользователей в таблице users */
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS year
FROM users;


/*Задание 2
 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
SELECT 
  DAYOFWEEK(CONCAT(2021, '-', SUBSTR(birthday_at, 6, 2), '-', SUBSTR(birthday_at, 9, 2))) AS day_of_week,
  COUNT(*) AS quantity
FROM users
GROUP BY day_of_week
ORDER BY day_of_week;













 