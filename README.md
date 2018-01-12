# Payara Micro NPE Sample

# Building
* `gradle war`

# Run Local
* `java -jar payara-micro-4.1.2.174.jar --deploy build/libs/payara-micro-npe-sample-1.0-SNAPSHOT.war --port 8999`

# Run Via Docker
* `docker build -t marcreichman/payara-micro-npe-sample .`
* `docker run -it -p 8999:8082 mreichman/payara-micro-npe-sample`

# Verifying Run
* `curl http://localhost:8999/status`
```
status is good
```