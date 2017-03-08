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
* https://github.com/logstash-plugins/logstash-input-jdbc

{
  "query": {
    "regexp": {
      "email_address": ".+?ahmed.*?"
    }
  }
}