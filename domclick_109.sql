--Выведите название страны, где находится город «Salzburg»
--Поля в результирующей таблице: country_name

SELECT country_name
FROM
  (SELECT a.name as city, 
    a.regionid as regionid,
    b.countryid as countryid,
    c.name as country_name
  FROM cities as a
    JOIN 
      (SELECT countryid::INTEGER,
        id,
        name
      FROM regions) as b      
      ON a.regionid = b.id
    JOIN countries as c
      ON b.countryid = c.id)
  WHERE city = 'Salzburg'