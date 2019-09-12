FROM java:8
MAINTAINER ezv.admin.ch
ARG SIGNING_CERTIFICATE_FILE
COPY ./eets-test-support-service.jar /opt/eets/lib/
COPY ${SIGNING_CERTIFICATE_FILE} /var/eets/test/service-conf/cert/signing-cert.cer
ENV SPRING_APPLICATION_JSON=''
ENTRYPOINT ["/usr/bin/java", "-Dspring.profiles.active=testsupport"]
CMD ["-jar", "/opt/eets/lib/eets-test-support-service.jar"]
#VOLUME /var/lib/spring-cloud/config-repo
