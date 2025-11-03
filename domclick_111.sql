--Посчитайте население каждого региона. В качестве результата выведите название региона и его численность населения.
--Поля в результирующей таблице: region_name total_population

SELECT region_name,
  SUM(population) as total_population
FROM
  (SELECT a.name as city,
      population,
      a.regionid as regionid,
      b.name as region_name
    FROM cities as a
      JOIN 
        (SELECT countryid::INTEGER,
          id,
          name
        FROM regions) as b      
        ON a.regionid = b.id)
GROUP BY region_name
ORDER BY 1