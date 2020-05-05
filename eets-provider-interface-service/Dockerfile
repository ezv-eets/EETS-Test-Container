FROM openjdk:11
MAINTAINER ezv.admin.ch
COPY eets-provider-interface-service.jar /opt/eets/lib/
ENV SPRING_APPLICATION_JSON=''
ENTRYPOINT ["java", "-Dspring.profiles.active=testsupport"]
CMD ["-jar", "/opt/eets/lib/eets-provider-interface-service.jar"]
