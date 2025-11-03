--Вывести идентификаторы всех владельцев комнат, что размещены на сервисе бронирования жилья и сумму, которую они заработали
--Поля в результирующей таблице: owner_id total_earn
--Используйте конструкцию "as owner_id" и "as total_earn" для вывода идентификаторов владельцев и заработанной суммы соответственно.


SELECT
  owner_id,
  SUM(total) as total_earn
FROM
  (SELECT
    a.owner_id as owner_id,
    b.room_id,
    b.total as total
  FROM rooms as a
    LEFT JOIN reservations as b
      ON a.id = b.room_id)
GROUP BY owner_id
ORDER BY owner_id