FROM openjdk:11
MAINTAINER ezv.admin.ch
ARG SIGNING_CERTIFICATE_FILE
COPY ./eets-test-support-service.jar /opt/eets/lib/
COPY ${SIGNING_CERTIFICATE_FILE} /var/eets/test/service-conf/cert/signing-cert.cer
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV SPRING_APPLICATION_JSON=''
ENTRYPOINT ["java", "-Dspring.profiles.active=testsupport"]
CMD ["-jar", "/opt/eets/lib/eets-test-support-service.jar"]
#VOLUME /var/lib/spring-cloud/config-repo
