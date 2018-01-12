# Payara Micro NPE Sample

This sample will output a loop of NPE log statements, every 2 seconds, after the service has been running for several hours.

# Run Via Docker Hub
* `docker run -it -p 8999:8082 marcreichman/payara-micro-npe-sample`

# Running Locally
* `gradle war`

## Run Direct
* `java -jar payara-micro-4.1.2.174.jar --deploy build/libs/payara-micro-npe-sample-1.0-SNAPSHOT.war --port 8999`

## Run Via Local Docker Build
* `docker build -t marcreichman/payara-micro-npe-sample .`
* `docker run -it -p 8999:8082 marcreichman/payara-micro-npe-sample`

# Verifying Run
* `curl http://localhost:8999/payara-micro-npe-sample/status`
```
status is good
```