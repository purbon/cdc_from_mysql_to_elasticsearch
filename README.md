# Change data capture for MySQL

This is an small PoC on building a [Change Data Capture](https://en.wikipedia.org/wiki/Change_data_capture) pipeline for a
MySQL database. This solution will allow you to stream all changes,
structural and in the data, into a target location.

## Getting Started

This repository contains platfrom used to capture changes in a MySQL
database. To do this we need different components such as a MySQL
database, a Kafka server, a maxwell daemon and an Apache NiFi agent.

For the shake of simplification this is setup here as docker containers,
however nothing prevents you from setting up everything on your own as
independent components.

### Prerequisits

To run this project you need a few components available in your system,
they are:

* Docker version 17.09.0-ce or newer.
* Docker compose versoin  1.16.1 or newer.
* Apache NiFi version 1.3 or newer.

### Before getting started

Before running the project we should change the static IP's in the
[docker-compose.yml](docker-compose.yml) file for the ones relevant in
your setup. This is necessary to the service is able to locate Apache
Kafka and the other components.

You should start your Apache NiFi agent with the flow that you will find
inside the [consumer-nifi](consumer-nifi) directory. To import this
flow, please copy the
[consumer-nifi/flow.xml.gz](consumer-nifi/flow.yml.gz). 

After you are done with that last step, and before starting the flow in
Apache NiFi, please make sure to update all the releavent component with
the addresses to locate the Kafka Cluster, the Elasticsearch outputs and
the shared file system.

### Starting everything

You can run the collection of components using the single command
```docker-compose up```, this will start all the necessary services,
except Apache NiFi.

After everything is up and running in the docker side, you will need to
still do a couple of more things.

First, start the Apache Nifi flow and the necessary external components
such as Elasticsearch or the shared file system.

Second, you will need to grant a few rights to the cdc user in MySQL, you
can do that with the SQL commands you can see in [setup/setup-db-perms.sql](setup/setup-db-perms.sql).

After that steps are done, you should see in the expected output
locations the changes that has been happening in the MySQL server
databases.

## Contributing

All contributions are welcome: ideas, patches, documentation, bug reports, complaints, and even something you drew up on a napkin.

## License

This project is licensed under the Apache License 2.0 - see the  [LICENSE](LICENSE) file for details
