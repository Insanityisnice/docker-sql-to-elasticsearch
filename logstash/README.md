# Logstash
It was necessary to add to the base logstash container and install the sql jdbc driver in order to connect to a sql database and pull data.

## Configuration
Put configuration files in the config folder and they will be built into the logstash container.

## Pipelines
The logstash.conf file contains the pipeline for pulling the data from sql using the jdbc driver.

### Points of interest
* Set the tracking column in order to only pull new or updated values in the sql query.
    * For northwind there is not timestamp column so just using the identity column to determine what to pull.
* Set the last_run_metadata_path for each input

## Scheduling
https://www.elastic.co/guide/en/logstash/current/plugins-inputs-jdbc.html#_scheduling

## Lessons Learned
* Add logical prefixs to the indexs, this allows easier filtering in the monitoring tools
