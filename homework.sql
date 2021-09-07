/*Задание 1
Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался 
с выбранным пользователем (написал ему сообщений).*/

-- Выбран пользователь с id = 1. Формируем запрос
SELECT 
  COUNT(*) AS max_messeges,
  from_user_id 
FROM messages 
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY max_messeges DESC 
LIMIT 1;


/*Задание 2
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..*/
SELECT 
 COUNT(*)
FROM likes
WHERE user_id IN (
  SELECT user_id FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10
);


/*Задание 3
Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT 
 COUNT(*) AS likes,
 'male'
FROM likes
WHERE user_id IN (
  SELECT user_id FROM profiles
	WHERE gender LIKE 'm'
)
UNION 
SELECT 
 COUNT(*) AS likes,
 'female'
FROM likes
WHERE user_id IN (
  SELECT user_id FROM profiles
	WHERE gender LIKE 'f'
)
ORDER BY likes DESC
LIMIT 1;









