/*Задача 2
Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке*/

SELECT DISTINCT firstname 
FROM users 
ORDER BY firstname;


/*Задача 3
Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)*/

/*Добавляем поле в таблицу profiles*/
ALTER TABLE profiles 
ADD COLUMN is_active tinyint(1) NOT NULL DEFAULT '1';

/*Обновляем таблицу*/
UPDATE profiles
SET is_active = 0
WHERE birthday > NOW() - INTERVAL 18 YEAR;


/*Задача 4
Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)*/

/*Т.к в таблице отсутсвуют такие сообщения, добавляем в таблицу несколько строк с датами "из будущего"*/
INSERT INTO messages 
VALUES (21,1,2,'Et ducimus alias eaque quia. Rerum tenetur ullam quisquam doloribus ut. Nostrum ad ipsa voluptas iusto omnis atque in. Architecto omnis eligendi quis ab magnam aut eos. Culpa debitis atque sit molestias ipsam laborum ratione.','2024-01-06 21:13:19'),
(22,2,3,'Omnis qui quae exercitationem neque. Dolor velit est voluptas totam nihil reprehenderit. Id delectus ullam sit ex est voluptates. Porro incidunt vel corporis pariatur laborum earum.','2022-11-06 02:39:08'),
(23,3,4,'Dolores rerum molestiae amet et provident ratione. Accusantium sequi ab nihil repellendus. Ipsa atque aut quaerat voluptatem amet. Qui architecto id magnam asperiores est.','2023-09-26 03:32:22');

/*Удяляем строки с сообщениями "из будущего"*/
DELETE FROM messages WHERE created_at > CURRENT_TIMESTAMP;




