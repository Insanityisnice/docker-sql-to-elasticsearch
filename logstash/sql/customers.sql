-- HACK: This is a poor way to get a identity on a table, since this is example code we'll live with with
-- HACK: but this should never be done in real application.
SELECT * FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY CustomerID ASC) AS [RowNumber], *
    FROM [Northwind].[dbo].[Customers] as c) as results
WHERE results.[RowNumber] > :sql_last_value