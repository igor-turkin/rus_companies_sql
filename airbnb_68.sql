--Для каждой комнаты, которую снимали как минимум 1 раз, найдите имя человека, снимавшего ее последний раз, и дату, когда он выехал
--Поля в результирующей таблице: room_id name end_date
--Используйте конструкцию "as room_id" для вывода идентификатора комнаты

WITH t1 as (SELECT room_id,
              MAX(end_date) as end_date
            FROM reservations
            GROUP BY room_id)

SELECT room_id,
  name,
  end_date
FROM t1
 JOIN reservations as a
  USING (room_id, end_date)
 JOIN users as b
  ON a.user_id = b.id 
ORDER BY 1