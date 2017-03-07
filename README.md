# Elastic Search Example using Logstash

# Running the Example

## Start the cluster
From the project directry run
> docker-compose up

### Checking the health of the cluster

#### Bash
> curl -u elastic http://localhost:9200/_cat/health

#### Powershell

```Powershell
$user = "user"
$pass= "password"
$secpasswd = ConvertTo-SecureString $pass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($user, $secpasswd)
Invoke-WebRequest -Credential elastic -URI http://localhost:9200/_cat/health
```

#### elasticsearch-head web dashboard

> http://localhost:9100/?auth_user=elastic&auth_password=changeme

More information can be found at https://github.com/mobz/elasticsearch-head

## Stoping the cluster
From the project directory run
> docker-compose stop

### Remove the containers
> docker-compose down


# IGNORE Just notes
## References

* http://blog.tabulaw.com/2015/08/elasticsearch-and-ms-sql-server-would.html
* http://blog.comperiosearch.com/blog/2014/01/30/elasticsearch-indexing-sql-databases-the-easy-way/
* https://github.com/jprante/elasticsearch-jdbc
* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
* https://github.com/elastic/elasticsearch


curl -XPUT -u elastic 'localhost:9200/_xpack/security/user/elastic/_password' -d '{
  "password" : "pa$$w0rd"
}'

curl -XPUT -u elastic 'localhost:9200/_xpack/security/user/kibana/_password' -d '{
  "password" : "pa$$w0rd"
}'

curl -XPUT -u elastic 'localhost:9200/_xpack/security/user/logstash_system/_password' -d '{
  "password" : "pa$$w0rd"
}'

curl -XPOST -u elastic 'localhost:9200/_xpack/security/role/events_admin' -d '{
  "indices" : [
    {
      "names" : [ "events*" ],
      "privileges" : [ "all" ]
    },
    {
      "names" : [ ".kibana*" ],
      "privileges" : [ "manage", "read", "index" ]
    }
  ]
}'
http
curl -XPOST -u elastic 'localhost:9200/_xpack/security/user/johndoe' -d '{
  "password" : "pa$$w0rd",
  "full_name" : "John Doe",
  "email" : "john.doe@anony.mous",
  "roles" : [ "events_admin" ]
}'



# tests
curl -u elastic -XPUT 'http://localhost:9200/twitter/user/kimchy?pretty' -H 'Content-Type: application/json' -d '{ "name" : "Shay Banon" }'

curl -u elastic -XPUT 'http://localhost:9200/twitter/tweet/1?pretty' -H 'Content-Type: application/json' -d '
{
    "user": "kimchy",
    "post_date": "2009-11-15T13:12:00",
    "message": "Trying out Elasticsearch, so far so good?"
}'

curl -u elastic -XPUT 'http://localhost:9200/twitter/tweet/2?pretty' -H 'Content-Type: application/json' -d '
{
    "user": "kimchy",
    "post_date": "2009-11-15T14:12:12",
    "message": "Another tweet, will it be indexed?"
}'

curl -u elastic -XGET 'http://localhost:9200/twitter/user/kimchy?pretty=true'
curl -u elastic -XGET 'http://localhost:9200/twitter/tweet/1?pretty=true'
curl -u elastic -XGET 'http://localhost:9200/twitter/tweet/2?pretty=true'


curl -u elastic -XGET 'http://localhost:9200/twitter/tweet/_search?q=user:kimchy&pretty=true'