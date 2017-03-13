# Example of pulling data from sql into Elastic Search using Logstash
In this example we use the 5.2.2 version of elasticsearch and logstash to pull data from sql server.  I put together this example because I could not find everything in one pace and wanted to keep an example around for future reference.

# Tools
## Required
* [docker](https://www.docker.com/)

## Optional 
* [vscode](https://code.visualstudio.com)

# References
* [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
* [Logstash](https://www.elastic.co/guide/en/logstash/current/index.html)
* [Kibana](https://www.elastic.co/guide/en/kibana/current/index.html)
* [Elasticsearch-head](https://github.com/mobz/elasticsearch-head)
* [Elastic Guides](https://www.elastic.co/guide/index.html)

# Running the Example
## Starting the example
From the project directry run
> docker-compose up

### Checking the health of the cluster
#### Bash
> curl -u elastic:changeme http://localhost:9200/_cat/health

#### Powershell
```Powershell
$user = "elastic"
$pass= "changeme"
$secpasswd = ConvertTo-SecureString $pass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($user, $secpasswd)
Invoke-WebRequest -Credential credential -URI http://localhost:9200/_cat/health
```
#### elasticsearch-head web dashboard
Browse to the following uri and connect to an elastic node
> http://localhost:9100

More information can be found at https://github.com/mobz/elasticsearch-head

#### Kibana
Browse to the following uri
> http://http://localhost:5601

## Stoping the cluster
From the project directory run
> docker-compose stop

### Remove the containers
From the project directory run
> docker-compose down

### Clean up the data volumes
NOTE: This will delete all volumes that are no longer referenced.  Run this command at your own risk.

From the commandline
> docker volume prune

## Known Issues
* ERROR: This machine must have at least 3.25 gigabytes of memory to install
    * You may experience this error from the sql container.  To correct this error open the docker settings, under the advanced tab, ensure that the memory is at least 3.25 GB.