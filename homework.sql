/*Практическое задание по теме “Оптимизация запросов”
Задание 1
Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается 
время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.*/
-- Создаем таблицу logs
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME DEFAULT NOW(),
	table_name VARCHAR(100),
	table_id BIGINT UNSIGNED, 
	name VARCHAR(255)
) ENGINE = Archive;

-- Переназначаем признак окончания запроса  
DELIMITER //

-- Создаем триггер для таблицы user
CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, table_id, name) VALUES ('users', NEW.id, NEW.name);
END//

-- Создаем триггер для таблицы catalogs
CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, table_id, name) VALUES ('catalogs', NEW.id, NEW.name);
END//

-- Создаем триггер для таблицы products
CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (table_name, table_id, name) VALUES ('products', NEW.id, NEW.name);
END//

-- Переназначаем признак окончания запроса  
DELIMITER ;
