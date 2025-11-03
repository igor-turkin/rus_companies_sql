--Выведи для каждого пользователя первое наименование, которое он заказал (первое по времени транзакции).
--Поля в результирующей таблице: user_id item

WITH t1 AS (
    SELECT user_id,
           MIN(transaction_ts) AS first_ts
    FROM transactions
    GROUP BY user_id)
  
SELECT user_id,
       item
FROM transactions t
WHERE transaction_ts = (
    SELECT first_ts
    FROM t1
    WHERE t1.user_id = t.user_id)