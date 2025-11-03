--Посчитать количество работающих складов на текущую дату по каждому городу. 
--Вывести только те города, у которых количество складов более 80. Данные на выходе - город, количество складов.
--Поля в результирующей таблице: city warehouse_count

SELECT city,
  COUNT(*) as warehouse_count
FROM warehouses
WHERE date_close IS NULL
GROUP BY city
HAVING COUNT(*) > 80
ORDER BY 2 DESC