--Вывести имена покупателей, каждый из которых приобрёл Laptop и Monitor (использовать наименование товара product.name) в марте 2024 года?
--Поля в результирующей таблице: name

SELECT name,
       products
FROM (
  SELECT 
    c.name,
    ARRAY_AGG(DISTINCT a.name) AS products
  FROM products a
  JOIN purchases b 
    USING (product_key)
  JOIN customers c 
    USING (customer_key)
  WHERE DATE_TRUNC('month', b.date) = DATE '2024-03-01'
  GROUP BY c.name
  ) as  t
WHERE products @> ARRAY['Laptop', 'Monitor']::varchar[]