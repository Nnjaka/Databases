/*Задание 1
Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).*/

-- Выбран пользователь с id = 1. Формируем запрос
SELECT 
  u.firstname,
  u.lastname,
  COUNT(*) AS max_messeges
FROM users AS u
JOIN messages AS m ON u.id = m.from_user_id
WHERE to_user_id = 1
GROUP BY m.from_user_id
ORDER BY max_messeges DESC 
LIMIT 1;


/*Задание 2
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..*/
SELECT 
 COUNT(*)
FROM likes AS l
JOIN profiles AS p ON l.user_id = p.user_id 
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;


/*Задание 3
Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT
  CASE 
    WHEN p.gender = 'f' THEN 'женщины'
    WHEN p.gender = 'm' THEN 'мужчины'
  END AS gender,
  COUNT(*) AS likes
FROM likes AS l
JOIN profiles AS p ON  l.user_id = p.user_id
GROUP BY p.gender
ORDER BY likes DESC
LIMIT 1;

