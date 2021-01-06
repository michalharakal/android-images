FROM openjdk:8-alpine as builder
WORKDIR /opt/antlr4
COPY ./antlr4 .
ARG MAVEN_OPTS="-Xmx1G"
RUN apk add --no-cache maven \
    && mvn clean --projects tool --also-make \
    && mvn -DskipTests install --projects tool --also-make \
    && mv ./tool/target/antlr4-*-complete.jar antlr4-tool.jar

FROM openjdk:8-alpine

ARG user=appuser
ARG group=appuser
ARG uid=1000
ARG gid=1000

RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/sh ${user}

COPY --from=builder /opt/antlr4/antlr4-tool.jar /usr/local/lib/
WORKDIR /work
ENTRYPOINT ["java", "-Xmx500M", "-cp", "/usr/local/lib/antlr4-tool.jar", "org.antlr.v4.Tool"]