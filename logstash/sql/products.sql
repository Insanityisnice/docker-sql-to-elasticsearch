SELECT *
FROM [Northwind].[dbo].[Products] as p
WHERE p.ProductID > :sql_last_value