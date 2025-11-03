--Вывести список имён сотрудников, получающих большую заработную плату, чем у непосредственного руководителя.
--Поля в результирующей таблице: name

SELECT a.name as name
FROM employees as a
  LEFT JOIN employees as b
    ON a.chief_id=b.id
WHERE a.chief_id IS NOT NULL and a.salary>b.salary