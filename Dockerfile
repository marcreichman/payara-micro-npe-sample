FROM openjdk:8-jdk
MAINTAINER Marc Reichman "marcreichman+payarabug@gmail.com"

ENV PAYARA_PKG http://payara.fish.s3.amazonaws.com/Payara+Downloads/Payara+4.1.2.174/payara-micro-4.1.2.174.jar
ENV PKG_FILE_NAME payara-micro.jar
ENV PAYARA_PATH /opt/payara

RUN useradd -b /opt -m -s /bin/bash -d $PAYARA_PATH payara && echo payara:payara | chpasswd && mkdir -p $PAYARA_PATH/deployments

# Default payara ports to expose
EXPOSE 4848 8009 8080 8181

WORKDIR $PAYARA_PATH

RUN wget -O $PAYARA_PATH/$PKG_FILE_NAME $PAYARA_PKG
COPY build/libs/payara-micro-npe-sample-1.0-SNAPSHOT.war /opt/payara/payara-micro-npe-sample.war
RUN chown -R payara:payara /opt
USER payara
CMD java  -jar /opt/payara/payara-micro.jar --deploy /opt/payara/payara-micro-npe-sample.war --port 8082
HEALTHCHECK --interval=15s CMD wget -q http://localhost:8082/payara-micro-npe-sample/status -O /dev/null || exit 1

