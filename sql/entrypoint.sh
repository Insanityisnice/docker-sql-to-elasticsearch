/opt/mssql/bin/sqlservr.sh & pid1=$! & /usr/src/sql/restore-database.sh

wait ${pid1}