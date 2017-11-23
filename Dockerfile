FROM quay.io/pires/docker-jre:8u131_alpine_nov

label maintainer Paulo Pires <pjpires@gmail.com>

ENV VERSION 3.9.0

RUN \
  apk add --update curl ca-certificates; apk upgrade; \
  curl -Lskj https://github.com/pires/hazelcast-kubernetes-bootstrapper/releases/download/$VERSION/hazelcast-kubernetes-bootstrapper-$VERSION.jar \
  -o /bootstrapper.jar;\
  apk del curl wget; \
  rm /var/cache/apk/*

CMD java -jar /bootstrapper.jar
