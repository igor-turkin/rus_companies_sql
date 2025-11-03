--Какой средний возраст клиентов, купивших Smartwatch (использовать наименование товара product.name) в 2024 году?
--Поля в результирующей таблице: average_ag

SELECT ROUND(AVG(c.age), 1) as average_ag
FROM products as a
  JOIN purchases as b
    USING (product_key)
  JOIN customers as c
    USING (customer_key)
WHERE a.name = 'Smartwatch' AND DATE_PART('year', b.date) = '2024'
GROUP BY a.name