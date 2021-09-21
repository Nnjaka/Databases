/*Транзакции, переменные, представления
 
  Задание 1
В базе данных shop и sample присутствуют одни 
и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции*/

-- Создаем БД sample
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

-- Создаем в рамках этой БД таблицу users
DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- Создаем транзакцию для перемещения записи
START TRANSACTION;
  INSERT INTO sample.users SELECT * FROM shop.users WHERE shop.users.id = 1;
  DELETE FROM shop.users WHERE shop.users.id = 1; 
COMMIT;


/*Задание 2
 Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.*/
-- Выбираем БД shop
 USE shop;

-- Создаем представление
CREATE OR REPLACE VIEW product_catalog (product, catalog_name) 
AS SELECT 
   p.name,
   c.name 
 FROM products AS p
 JOIN catalogs AS c ON p.catalog_id = c.id;
 


  
/*Хранимые процедуры и функции, триггеры
Задание 1
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/
  
-- Переназначаем признак окончания запроса  
DELIMITER //

-- Создаем функцию
CREATE FUNCTION hello ()
RETURNS TEXT READS SQL DATA
BEGIN
	DECLARE h INT;
	SET h = HOUR(NOW());
	  IF (h BETWEEN 0 AND 6) THEN
	    RETURN "Доброй ночи";
	  ELSE IF (h BETWEEN 7 AND 12) THEN
	    RETURN "Доброе утро";
	  ELSE IF (h BETWEEN 13 AND 18) THEN
	    RETURN "Добрый день"; 
	  ELSE IF (h BETWEEN 19 AND 24) THEN
	    RETURN "Добрый вечер";
	  END IF;
END//

-- Переназначаем признак окончания запроса  
DELIMITER ;

-- Вызываем функцию
SELECT hello();


/*Задание 2
В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей 
или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы 
одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.*/

-- Переназначаем признак окончания запроса  
DELIMITER //

-- Создаем триггер
CREATE TRIGGER name_discription BEFORE INSERT ON products
FOR EACH ROW 
BEGIN 
	IF (NEW.name IS NULL AND NEW.description IS NULL) THEN 
	  SIGNAL SQLSTATE '45000' 
	  SET MESSAGE_TEXT = 'Ошибка! Заполните поле name или description';
	END IF; 
END//

-- Переназначаем признак окончания запроса  
DELIMITER ;







