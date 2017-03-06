docker build . --tag sql-test
docker run -i --name sql -e SA_PASSWORD=Turk3yT1m3 -p 1433:1433 sql-test

docker exec -it sql sh