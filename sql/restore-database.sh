# wait for the SQL Server to come up
sleep 60s

# run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Turk3yT1m3 -d master -i setup.sql