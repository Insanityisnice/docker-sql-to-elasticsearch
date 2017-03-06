
### Running SQL Container
docker run -i -e ACCEPT_EULA=Y -e SA_PASSWORD=Turk3yT1m3 -p 1433:1433 -d  microsoft/mssql-server-linux

### Running Logstash
docker build . --tag logstash-test
docker run --rm -it -e SQLSERVER_NAME=192.168.1.2 logstash-test

# Logstash Setup
## Scheduling
https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html#_scheduling