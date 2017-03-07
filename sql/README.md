docker build . --tag sql-test
docker run -i --name sql -p 1433:1433 sql-test

docker exec -it sql sh