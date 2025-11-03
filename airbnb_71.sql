--Найдите какой процент пользователей, зарегистрированных на сервисе бронирования, хоть раз арендовали или сдавали в аренду жилье. Результат округлите до сотых.
--Поля в результирующей таблице: percent
--Используйте конструкцию "as percent" для вывода процента активных пользователей. Пример формата ответа: 65.23

WITH t1 as (SELECT 
  (SELECT COUNT(DISTINCT id) FROM users) + (SELECT COUNT(DISTINCT owner_id) FROM rooms) as all_users),

  t2 as (SELECT a.id,
          a.user_id,
          b.owner_id
        FROM reservations as a
         LEFT JOIN rooms as b
          ON a.room_id = b.id),

  t3 as (SELECT (SELECT COUNT (DISTINCT user_id) FROM t2) + (SELECT COUNT (DISTINCT owner_id) FROM t2) as actual_users)

SELECT 
  ROUND(t3.actual_users / t1.all_users::DECIMAL*100, 2) as percent
FROM t1, t3