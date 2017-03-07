IF (NOT EXISTS (SELECT [database_id] FROM [sys].[databases] WHERE [name]='Northwind'))
BEGIN
    RESTORE DATABASE Northwind FROM DISK='/tmp/Northwind.bak' 
        WITH MOVE 'Northwind' TO '/var/opt/mssql/data/NORTHWND.MDF', 
             MOVE 'Northwind_log' TO '/var/opt/mssql/data/NORTHWND_log.ldf' 
END