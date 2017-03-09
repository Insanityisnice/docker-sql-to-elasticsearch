SELECT *
FROM [Northwind].[dbo].[Employees] as e
WHERE e.EmployeeID > :sql_last_value
