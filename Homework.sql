/*Задача
 Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
 */

/*--Удаляем и создаем таблицу с данными о подарках*/
DROP TABLE IF EXISTS gifts;
CREATE TABLE gifts(
  id SERIAL,
  name VARCHAR(255),
  price DECIMAL (11,2)
);

/*Удаляем и создаем таблицу с данными об отправленных подарках подарках. Здесь не получится сделать первичный ключ состоящий из нескольких полей, т.к. один пользователь может отпраить другому неограниченное количество одинаковых подарков.*/
DROP TABLE IF EXISTS users_gifts;
CREATE TABLE users_users_gifts(
  id SERIAL,
  initiator_user_id BIGINT UNSIGNED NOT NULL,
  target_user_id BIGINT UNSIGNED NOT NULL, 
  gift_id BIGINT UNSIGNED NOT NULL,
  message TEXT,
  created_at DATETIME DEFAULT NOW(),
  
  FOREIGN KEY (initiator_user_id) REFERENCES users(id),
  FOREIGN KEY (target_user_id) REFERENCES users(id),
  FOREIGN KEY (gift_id) REFERENCES gifts(id)
);
  
/*Удаляем и создаем таблицу с фотографиями пользователя*/
DROP TABLE IF EXISTS photos;
CREATE TABLE photos(
  id SERIAL,
  user_id BIGINT UNSIGNED NOT NULL,
  description TEXT,
  filename VARCHAR(255),
  metadata JSON,
  created_ad DATETIME DEFAULT NOW(),
  updated_ad DATETIME ON UPDATE CURRENT_TIMESTAMP,  
    
  FOREIGN KEY (user_id) REFERENCES users(id)
);

/*Удаляем и создаем таблицу с фотоальбомами*/
DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums(
  user_id BIGINT UNSIGNED NOT NULL,
  photo_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(255),
  
  PRIMARY KEY (user_id, photo_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id)
);

  
